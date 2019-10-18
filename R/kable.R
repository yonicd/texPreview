#' @title Try to coerce an object into a knitr_kable object
#' @description coerce objects into a knitr_kable class object with a latex format
#' @param x object
#' @return an object of class knitr_kable
#' @examples 
#' 
#' tex <- '\\begin{tabular}{llr}
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
#' ktex <- as.kable(tex)
#' 
#' class(ktex)
#' 
#' attributes(ktex)
#' 
#' ktex
#' 
#' # using an input call
#' 
#' x <- tex_preview(tex,returnType = 'input')
#' 
#' x
#' 
#' ktex_input <- as.kable(x)
#' 
#' class(ktex_input)
#' 
#' attributes(ktex_input)
#' 
#' ktex_input
#' 
#' # file path
#' 
#' x <- tex_preview(tex,returnType = 'input')
#' 
#' ktex_path <- as.kable(file.path(tempdir(),'tex_temp.tex'))
#' 
#' class(ktex_path)
#' 
#' attributes(ktex_path)
#' 
#' ktex_path
#' 
#' @export
as.kable <- function(x){
  UseMethod('as.kable')
}

#' @export
as.kable.knitr_kable <- function(x){
  return(x)
}

#' @export
#' @importFrom fs is_file
as.kable.default <- function(x){
  
  if(fs::is_file(x))
    x <- readLines(x,warn = FALSE)
  
  structure(paste0(x,collapse = '\n'),class = 'knitr_kable',format = 'latex')
  
}

#' @export
as.kable.texpreview_input <- function(x){
  x <- gsub('^\\\\input\\{|\\}$','',as.character(x))
  structure(paste0(readLines(x),collapse = '\n'),class = 'knitr_kable',format = 'latex')
}
