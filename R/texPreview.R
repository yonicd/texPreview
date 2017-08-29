#' @title Render and Preview snippets of TeX in R Viewer
#' @export
#' @description input TeX script into the function and it renders a pdf and converts it an image which is sent to Viewer.
#' @param obj character, TeX script
#' @param stem character, name to use in output files, Default: NULL
#' @param fileDir character, output destination. If NULL a temp.dir() 
#' will be used and no output will be saved
#' @param overwrite logical, controls if overwriting of output stem* files given their existences
#' @param margin table margin for pdflatex call, Default: tex_opts$get('margin')
#' @param imgFormat character, defines the type of image the PDF is 
#' converted to Default: tex_opts$get('imgFormat')
#' @param print.xtable.opts list, contains arguments to pass to print.table, 
#' relevant only if xtable is used as the input, Default: tex_opts$get('print.xtable.opts')
#' @param returnType character, one of "viewer", "html", or "tex" determining appropriate 
#' return type for the rendering process, Default: tex_opts$get('returnType')
#' @param opts.html list, html options, Default: tex_opts$get('opts.html')
#' @param usrPackages character, vector of usepackage commands, see details for string format
#' @param engine character, specifies which latex to pdf engine to use
#'  ('pdflatex','xelatex','lualatex'), Default: tex_opts$get('engine')
#' @param cleanup character, vector of file extensions to clean up after building pdf,
#'  Default: tex_opts$get('cleanup')
#' @param keep_pdf logical, controls if the rendered pdf file should be kept
#'  or deleted, Default is FALSE
#' @param tex_message logical, controls if latex executing messages 
#' are displayed in console. Default is FALSE
#' @param density numeric, controls the density of the image. Default is 150: tex_opts$get('density)
#' @param tex_lines vector of character, in case of special needs, instead of asking 
#' texPreview to build up, you may choose to pass in the contents of the 
#' complete LaTeX file directly. It should be a vector of character with each 
#' element as a line of raw TeX code. 
#' @param ... passed to \code{system}
#' @details The function assumes the system has pdflatex installed and it is defined in the PATH. The function does not return anything to R.
#' If fileDir is specified then two files are written to the directory. An image file of the name stem with the extension specified in imgFormat.
#' The default extension is png.The second file is the TeX script used to create the output of the name stem.tex.   If you do not wish to view the 
#' console output, pass the corresponding arguments to \code{...}, e.g., ignore.stdout=TRUE.
#' usrPackage accepts a vector of character strings built by the function \code{\link{buildUsepackage}}, of the form
#'  \\\\usepackage[option1,option2,...]\{package_name\}, see the TeX wikibook for more information \url{https://en.wikibooks.org/wiki/LaTeX/Document_Structure#Packages}.
#' @return 
#' NULL
#' @examples
#' data('iris')
#' \donttest{
#' if(interactive()){
#' texPreview(obj = xtable::xtable(head(iris,10)),stem = 'eq',imgFormat = 'svg')
#' 
#' \dontrun{
#' tex='\\begin{tabular}{llr}
#' \\hline
#' \\multicolumn{2}{c}{Item} \\\\
#' \\cline{1-2}
#' Animal    & Description & Price (\\$) \\\\
#' \\hline
#' Gnat      & per gram    & 13.65      \\\\
#' & each        & 0.01       \\\\
#' Gnu       & stuffed     & 92.50      \\\\
#' Emu       & stuffed     & 33.33      \\\\
#' Armadillo & frozen      & 8.99       \\\\
#' \\hline
#' \\end{tabular}'
#' 
#' texPreview(obj = tex,stem = 'eq',imgFormat = 'svg')
#' 
#' tikzEx=readLines('http://www.texample.net/media/tikz/examples/TEX/credit-rationing.tex')
#' usetikz=paste(tikzEx[14:23],collapse="\n")
#' bodytikz=paste(tikzEx[25:90],collapse="\n")
#' 
#' texPreview(obj = bodytikz,
#' usrPackages = buildUsepackage(pkg = 'tikz',uselibrary = usetikz))
#' }
#' }
#' }
#' @importFrom svgPanZoom svgPanZoom
#' @importFrom xml2 read_xml
#' @importFrom magick image_convert image_read image_write
#' @importFrom xtable xtable


texPreview <- function (obj, 
                        stem = NULL,
                        fileDir = NULL, 
                        overwrite = TRUE, 
                        margin = tex_opts$get('margin'),
                        imgFormat = tex_opts$get('imgFormat'), 
                        print.xtable.opts = tex_opts$get('print.xtable.opts'),
                        returnType = tex_opts$get('returnType'),
                        opts.html = tex_opts$get('opts.html'),
                        usrPackages = NULL,
                        engine = tex_opts$get('engine'),
                        cleanup = tex_opts$get('cleanup'),
                        keep_pdf = FALSE, 
                        tex_message = FALSE, 
                        density = tex_opts$get('density'),
                        tex_lines = NULL, 
                        ...) 
{
  
  if (is.null(fileDir)) {
    
    fileDir <- tempdir()
    
    if (!dir.exists(fileDir)) 
      dir.create(fileDir, recursive = TRUE,showWarnings = FALSE)
    
    writeFlg <- FALSE
    
  }else {
    
    writeFlg <- TRUE
    
    if (!dir.exists(fileDir)){
      
      if(returnType=='viewer') 
        return()
      
    }else{
      
      dir.create(fileDir, recursive = TRUE,showWarnings = FALSE)
      
    }
      
  }
  
  if(is.null(stem))
    #stem <- paste0("tex_", format(Sys.time(), "%Y-%m-%d_%H:%M:%S"))
    stem <- "tex_temp"
  
  if (is.null(tex_lines)) {
  
    if ("xtable" %in% class(obj)) {
      print.xtable.opts$x <- obj
      print.xtable.opts$comment <- FALSE
      
      if (!"file" %in% names(print.xtable.opts)) print.xtable.opts$file <- file.path(fileDir, paste0(stem,".tex"))
        
      obj <- do.call("print", print.xtable.opts)
    }

    tex_lines <- c(
      sprintf("\\documentclass[varwidth, border={%s %s %s %s}]{standalone}", margin$left, margin$top, margin$right, margin$bottom), 
      "\\usepackage[usenames,dvispnames,svgnames,table]{xcolor}", 
      "\\usepackage{multirow}",
      "\\usepackage{helvet}", 
      "\\usepackage{amsmath}", 
      "\\usepackage{rotating}", 
      "\\usepackage{graphicx}", 
      "\\renewcommand{\\familydefault}{\\sfdefault}", 
      "\\usepackage{setspace}", 
      "\\usepackage{caption}", 
      "\\captionsetup{labelformat=empty}",
      usrPackages, 
      "\\begin{document}",
      obj,
      "\\end{document}"    
    )
  
  }
  
  
  x <- getwd()
  

  setwd(fileDir)
  
  interaction_mode <- ifelse(tex_message, "nonstopmode", "batchmode")
  
  temp_file <- file.path(getwd(),sprintf("%sDoc.tex",stem))
  
  writeLines(tex_lines, con = temp_file)
  
  system(sprintf("%s -synctex=1 -interaction=%s --halt-on-error %s",engine,interaction_mode,temp_file),...)
  
  setwd(x)
  
  imgOut <- magick::image_convert(image =  magick::image_read(path = file.path(fileDir, paste0(stem, "Doc.pdf")),
                                                             density = density),
                                 format = imgFormat, 
                                 depth = 16)
  
  if (writeFlg & overwrite) {
    magick::image_write(imgOut, file.path(fileDir, paste0(stem,".", imgFormat)))
    if (!"file" %in% names(print.xtable.opts)) 
      print.xtable.opts$file <- file.path(fileDir, paste0(stem,".tex"))
    if ("xtable" %in% class(obj)) 
      do.call("print", print.xtable.opts)
  }

  if(returnType!='shiny'){
    if(imgFormat=='svg'&'svgPanZoom'%in%rownames(utils::installed.packages())){
      magick::image_write(imgOut, file.path(fileDir, paste0(stem,".", imgFormat)))
      xmlSvg <- paste0(readLines(file.path(fileDir, paste0(stem,".", imgFormat))),collapse = '\n')
      print(svgPanZoom::svgPanZoom(xml2::read_xml(xmlSvg)))
    }else{
      utils::capture.output(x <- print(imgOut))
    } 
  }

  if(!is.null(cleanup)) unlink(list.files(fileDir,pattern = paste0(cleanup,collapse ='|'),full.names = TRUE))
  
  if(returnType=='viewer') return(NULL)
  
  if(returnType%in%c("html", "html5", "s5", "slidy","slideous", "dzslides", "revealjs","md")){
    return(writeLines(sprintf('<img src="%s" height="%s" width="%s" />', 
                              file.path(fileDir,paste0(stem,'.',imgFormat)),
                              opts.html$height, opts.html$width)
                      )
           )
  } 
  
  if(returnType%in%c('latex','beamer')) return(writeLines(obj))


}
