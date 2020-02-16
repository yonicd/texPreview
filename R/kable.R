#' @title Try to coerce an object into a knitr_kable object
#' @description coerce objects into a knitr_kable class object with a latex format
#' @param x object, can be tex character, object return by returnType = "input", 
#' or a path to a tex file.
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
#' # file path
#' 
#' toy <- system.file('examples/toy/toy.tex',package = 'texPreview')
#' 
#' ktex_path <- as.kable(toy)
#' 
#' class(ktex_path)
#' 
#' attributes(ktex_path)
#' 
#' ktex_path
#' 
#' # texpreview_input class
#'   # this is the same output class as one would get with
#'   # tex_preview(tex,returnType = 'input')
#' 
#' toy_input <- structure(sprintf('\\input{%s}',toy),class = 'texpreview_input')
#' 
#' toy_input
#' 
#' as.kable(toy_input)
#' 
#' @concept utils
#' @rdname as_kable
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
  
  if(length(x)==1){
    if(fs::is_file(x))
      x <- readLines(x,warn = FALSE)    
  }

  structure(paste0(x,collapse = '\n'),class = 'knitr_kable',format = 'latex')
  
}

#' @export
as.kable.texpreview_input <- function(x){
  x <- gsub('^\\\\input\\{|\\}$','',as.character(x))
  structure(paste0(readLines(x),collapse = '\n'),class = 'knitr_kable',format = 'latex')
}
