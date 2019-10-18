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
#' @export
as.kable <- function(x){
  UseMethod('as.kable')
}

#' @export
as.kable.knitr_kable <- function(x){
  return(x)
}

#' @export
as.kable.default <- function(x){
  
  structure(paste0(x,collapse = '\n'),class = 'knitr_kable',format = 'latex')
  
}

#' @export
as.kable.texpreview_input <- function(x){
  x <- gsub('^\\\\input\\{|\\}$','',as.character(x))
  structure(paste0(readLines(x),collapse = '\n'),class = 'knitr_kable',format = 'latex')
}
