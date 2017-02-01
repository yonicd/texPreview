#' @title Render and Preview snippets of TeX in R Viewer
#' @export
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
#' @details The function assumes the system has pdflatex installed and it is defined in the PATH. The function does not return anything to R.
#' If fileDir is specified then two files are written to the directory. An image file of the name stem with the extension specified in imgFormat.
#' The default extension is png.The second file is the TeX script used to create the output of the name stem.tex. 
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
#' texPreview(obj = x,stem = 'eq',imgFormat = 'png')


texPreview <- function (obj, stem, fileDir = NULL, overwrite = T, 
                        margin=list(left=10, top=5, right=50, bottom=5),
                        imgFormat = "png", 
                        print.xtable.opts = list(), returnType="viewer",
                        opts.html=list(width="100%",height="100%")) 
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
    "\\usepackage{caption}", "\\captionsetup{labelformat=empty}", 
    "\\begin{document}", obj, "\\end{document}"    
  )
  writeLines(newobj, con = file.path(fileDir, paste0(stem, "Doc.tex")))
  x = getwd()
  setwd(fileDir)
  system(paste("pdflatex", 
               "-interaction=nonstopmode --halt-on-error",
               file.path(paste0(stem,  "Doc.tex"))
              ))
  setwd(x)
  imgOut = image_convert(image = image_read(path = file.path(fileDir, 
                                                             paste0(stem, "Doc.pdf")), density = 150), format = imgFormat, 
                         depth = 16)
  #cat("\014")
  if (writeFlg & overwrite) {
    image_write(imgOut, file.path(fileDir, paste0(stem, 
                                                  ".", imgFormat)))
    if (!"file" %in% names(print.xtable.opts)) 
      print.xtable.opts$file = file.path(fileDir, paste0(stem, 
                                                         ".tex"))
    if ("xtable" %in% class(obj)) 
      do.call("print", print.xtable.opts)
  }

  capture.output(x <- print(imgOut))

  switch(returnType,
         viewer = return(NULL),
         html = return(writeLines(
           sprintf('<img src="%s" height="%s" width="%s" />', 
                   file.path(fileDir,paste0(stem,'.',imgFormat)), opts.html$height, opts.html$width))),
         latex = return(writeLines(obj)),
         beamer = return(writeLines(obj))
  )
}