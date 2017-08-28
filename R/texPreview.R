#' @title Render and Preview snippets of TeX in R Viewer
#' @export
#' @description input TeX script into the function and it renders a pdf and converts it an image which is sent to Viewer.
#' @param obj character, TeX script
#' @param stem character, name to use in output files, Default: paste0("tex_", format(Sys.time(), "\%Y-\%m-\%d_\%H:\%M:\%S"))
#' @param fileDir character, output destination. If NULL a temp.dir() will be used and no output will be saved
#' @param overwrite logical, controls if overwriting of output stem* files given their existences
#' @param margin table margin for pdflatex call, Default: tex_opts$get('margin')
#' @param imgFormat character, defines the type of image the PDF is converted to. Default: tex_opts$get('imgFormat')
#' @param print.xtable.opts list, contains arguments to pass to print.table, 
#' relevant only if xtable is used as the input, Default: tex_opts$get('print.xtable.opts')
#' @param returnType character, one of "viewer", "html", or "tex" determining appropriate 
#' return type for the rendering process, Default: tex_opts$get('returnType')
#' @param opts.html list, html options, Default: tex_opts$get('opts.html')
#' @param usrPackages character, vector of usepackage commands, see details for string format
#' @param engine character, specifies which latex to pdf engine to use ('pdflatex' default,'xelatex','lualatex')
#' @param cleanup character, vector of file extensions to clean up after building pdf, Defualt: tex_opts$get('cleanup')
#' @param tex_message logical, controls if latex executing messages are displayed in console. Default is FALSE. 
#' @param ... passed to \code{system}
#' 
#' 
#' @details The function assumes the system has pdflatex installed and it is defined in the PATH. The function does not return anything to R.
#' If fileDir is specified then two files are written to the directory. An image file of the name stem with the extension specified in imgFormat.
#' The default extension is png.The second file is the TeX script used to create the output of the name stem.tex.   If you do not wish to view the 
#' console output, pass the corresponding arguments to \code{...}, e.g., ignore.stdout=T.
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
#' stem='tikzTest',imgFormat = 'svg',
#' usrPackages = buildUsepackage(pkg = 'tikz',uselibrary = usetikz))
#' }
#' }
#' }
#' @importFrom svgPanZoom svgPanZoom
#' @importFrom xml2 read_xml
#' @importFrom magick image_convert image_read image_write
#' @importFrom xtable xtable


texPreview <- function(obj, 
                       stem = NULL,
                       fileDir = NULL,
                       overwrite = TRUE, 
                       margin=tex_opts$get('margin'),
                       imgFormat = tex_opts$get('imgFormat'), 
                       print.xtable.opts = tex_opts$get('print.xtable.opts'),
                       returnType = tex_opts$get('returnType'),
                       opts.html = tex_opts$get('opts.html'),
                       usrPackages = NULL,
                       engine = c('pdflatex','xelatex','lualatex'),
                       cleanup = tex_opts$get('cleanup'),
                       tex_message = FALSE, 
                       density = tex_opts$get('density'),
                       keep_pdf = FALSE, 
                       ...) 
{
  
  if (!is.null(fileDir)) {
    current_dir <- getwd()
    setwd(fileDir)
  }
  
  if ("xtable" %in% class(obj)) {
    print.xtable.opts$x = obj
    print.xtable.opts$comment = FALSE
    
    if (!"file" %in% names(print.xtable.opts)) {
      print.xtable.opts$file = paste0(temp_file, ".tex")
    }
    
    obj = do.call("print", print.xtable.opts)
  }
  
  newobj <- c(
    sprintf("\\documentclass[varwidth, border={%s %s %s %s}]{standalone}",
            margin$left, margin$top, margin$right, margin$bottom), 
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
  
  temp_file <- paste0("table_", format(Sys.time(), "%Y-%m-%d_%H:%M:%S"))
  writeLines(newobj, con = paste0(temp_file, ".tex"))
  
  interaction_mode <- ifelse(tex_message, "nonstopmode", "batchmode")
  system(paste0(engine, " -synctex=1 -interaction=", interaction_mode, 
                " --halt-on-error ", temp_file, ".tex"),
         ...)
  
  if (!is.null(cleanup)) {
    files_to_unlink <- paste0(temp_file,".", cleanup)
    unlink(files_to_unlink)
  }
  
  imgOut <- magick::image_read(path = paste0(temp_file, ".pdf"), 
                               density = density)
  imgOut <- magick::image_convert(imgOut, format = imgFormat, depth = 16)
  
  if (!keep_pdf) {
    unlink(paste0(temp_file, ".pdf"))
  }
  
  #cat("\014")
  if (!is.null(fileDir)) {
    setwd(current_dir)
  }
  
  if (!is.null(stem) & overwrite) {
    magick::image_write(imgOut, paste0(stem,".", imgFormat))
    if (!"file" %in% names(print.xtable.opts)) 
      print.xtable.opts$file = file.path(fileDir, paste0(stem, ".tex"))
    if ("xtable" %in% class(obj)) 
      do.call("print", print.xtable.opts)
  }
  
  if(returnType!='shiny'){
    if(imgFormat=='svg'&'svgPanZoom'%in%rownames(utils::installed.packages())){
      magick::image_write(imgOut, file.path(fileDir, paste0(stem,".", imgFormat)))
      xmlSvg=paste0(readLines(file.path(fileDir, paste0(stem,".", imgFormat))),collapse = '\n')
      print(svgPanZoom::svgPanZoom(xml2::read_xml(xmlSvg)))
    }else{
      utils::capture.output(x <- print(imgOut))
    } 
  }
  
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
