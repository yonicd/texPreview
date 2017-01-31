#' @title Render and Preview snippets of TeX in R Viewer
#' @export
#' @description input TeX script into the function and it renders a pdf and converts it an image which is sent to Viewer.
#' @param obj character, TeX script
#' @param stem character, name to use in output files
#' @param fileDir character, output destination. If NULL a temp.dir() will be used and no output will be saved
#' @param overwrite logical, controls if overwriting of output stem* files given their existences
#' @param imgFormat character, defines the type of image the PDF is converted to.
#' @param print.xtable.opts list containing arguments to pass to print.table, relevant only if xtable is used as the input
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


texPreview <- function (obj, stem, fileDir = NULL, overwrite = T, imgFormat = "png", 
                        print.xtable.opts = list(), returnType="viewer") 
{
  if (is.null(fileDir)) {
    fileDir <- tempdir()
    if (!dir.exists(fileDir)) 
      dir.create(fileDir, recursive = T)
    writeFlg = F
  }
  else {
    writeFlg = T
    if (!dir.exists(fileDir)) 
      return()
  }
  if ("xtable" %in% class(obj)) {
    print.xtable.opts$x = obj
    if (!"file" %in% names(print.xtable.opts)) 
      print.xtable.opts$file = file.path(fileDir, paste0(stem, 
                                                         ".tex"))
    obj = do.call("print", print.xtable.opts)
  }
  newobj <- c(
    "\\documentclass[varwidth, border={10 5 50 5}]{standalone}", 
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
  cat("\f")
  if (writeFlg & overwrite) {
    image_write(imgOut, file.path(fileDir, paste0(stem, 
                                                  ".", imgFormat)))
    if (!"file" %in% names(print.xtable.opts)) 
      print.xtable.opts$file = file.path(fileDir, paste0(stem, 
                                                         ".tex"))
    if ("xtable" %in% class(obj)) 
      do.call("print", print.xtable.opts)
  }
  print(imgOut)
  # suppressWarnings({
  #   junk = sapply(list.files(file.path(fileDir), pattern = "Doc"), 
  #                 function(x) file.remove(file.path(fileDir, x)))
  # })
  switch(returnType,
         nothing = return(NULL),
         html = return(sprintf('<img src="%s" />', 
                               file.path(fileDir,paste0(stem,'.',imgFormat)))),
         tex = return(writeLines(obj))
  )
}