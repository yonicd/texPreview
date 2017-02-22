#' @title Render and Preview snippets of TeX in R Viewer
#' @export
#' @import svgPanZoom
#' @import xml2
#' @description input TeX script into the function and it renders a pdf and converts it an image which is sent to Viewer.
#' @param obj character, TeX script
#' @param stem character, name to use in output files
#' @param fileDir character, output destination. If NULL a temp.dir() will be used and no output will be saved
#' @param overwrite logical, controls if overwriting of output stem* files given their existences
#' @param margin table margin for pdflatex call
#' @param imgFormat character, defines the type of image the PDF is converted to.
#' @param print.xtable.opts list containing arguments to pass to print.table, relevant only if xtable is used as the input
#' @param returnType one of "viewer", "html", or "tex" determining appropriate return type for the rendering process
#' @param opts.html a list of html options, currently height and width.  can be specified as percentage or pixels.
#' @param usrPackages character of usepackage commands, see details for string format
#' @param engine character specifies which latex to pdf engine to use ('pdflatex' default,'xelatex','lualatex')
#' @param ... passed to \code{system}
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
#' 
#' texPreview(obj = xtable(head(iris,10)),stem = 'eq',imgFormat = 'svg')
#' 
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
#' texPreview(obj = tex,stem = 'eq',imgFormat = 'png')
#' 
#' tikzEx=readLines('http://www.texample.net/media/tikz/examples/TEX/credit-rationing.tex')
#' usetikz=paste(tikzEx[14:23],collapse="\n")
#' bodytikz=paste(tikzEx[25:90],collapse="\n")
#' 
#' texPreview(obj = bodytikz,stem='tikzTest',imgFormat = 'svg',usrPackages = buildUsepackage(pkg = 'tikz',uselibrary = usetikz))


texPreview <- function (obj, stem, fileDir = NULL, overwrite = T, 
                        margin=list(left=10, top=5, right=50, bottom=5),
                        imgFormat = "png", 
                        print.xtable.opts = list(), returnType="viewer",
                        opts.html=list(width="100%",height="100%"),
                        usrPackages=NULL,engine=c('pdflatex','xelatex','lualatex'),
                        ...) 
{
  if (is.null(fileDir)) {
    fileDir <- tempdir()
    if (!dir.exists(fileDir)) 
      dir.create(fileDir, recursive = T)
    writeFlg = F
  }
  else {
    writeFlg = T
    if (!dir.exists(fileDir)){
      if(returnType=='viewer') return()
    }else{
      suppressWarnings(dir.create(fileDir, recursive = T))
    }
      
  }
  if ("xtable" %in% class(obj)) {
    print.xtable.opts$x = obj
    print.xtable.opts$comment=F
    
    if (!"file" %in% names(print.xtable.opts)) print.xtable.opts$file = file.path(fileDir, paste0(stem,".tex"))
      
    obj = do.call("print", print.xtable.opts)
  }
  newobj <- c(
    sprintf("\\documentclass[varwidth, border={%s %s %s %s}]{standalone}",
            margin$left, margin$top, margin$right, margin$bottom), 
    "\\usepackage[usenames,dvispnames,svgnames,table]{xcolor}", 
    "\\usepackage{multirow}", "\\usepackage{helvet}", "\\usepackage{amsmath}", 
    "\\usepackage{rotating}", "\\usepackage{graphicx}", 
    "\\renewcommand{\\familydefault}{\\sfdefault}", "\\usepackage{setspace}", 
    "\\usepackage{caption}", "\\captionsetup{labelformat=empty}",usrPackages, 
    "\\begin{document}", obj, "\\end{document}"    
  )
  writeLines(newobj, con = file.path(fileDir, paste0(stem, "Doc.tex")))
  x = getwd()
  setwd(fileDir)
  system(paste(engine, "-synctex=1 -interaction=nonstopmode --halt-on-error",file.path(paste0(stem,  "Doc.tex"))),
         ...)
  setwd(x)
  imgOut = image_convert(image = image_read(path = file.path(fileDir, 
                                                             paste0(stem, "Doc.pdf")), density = 150), format = imgFormat, 
                         depth = 16)
  #cat("\014")
  if (writeFlg & overwrite) {
    image_write(imgOut, file.path(fileDir, paste0(stem,".", imgFormat)))
    if (!"file" %in% names(print.xtable.opts)) 
      print.xtable.opts$file = file.path(fileDir, paste0(stem, 
                                                         ".tex"))
    if ("xtable" %in% class(obj)) 
      do.call("print", print.xtable.opts)
  }

  if(returnType!='shiny'){
    if(imgFormat=='svg'){
      image_write(imgOut, file.path(fileDir, paste0(stem,".", imgFormat)))
      xmlSvg=paste0(readLines(file.path(fileDir, paste0(stem,".", imgFormat))),collapse = '\n')
      print(svgPanZoom(read_xml(xmlSvg)))
    }else{
      capture.output(x <- print(imgOut))
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