#' @export
#' @importFrom knitr knit_print
knit_print.texpreview_tex <- function(x,...){
  x <- paste0(x,collapse = '\n')
  class(x) <- 'knit_asis'
  x
  
}

#' @export
print.texpreview_viewer <- function(x,...){
  x <- as.null(x)
  invisible(x)
}

#' @export
print.texpreview_tex <- function(x,...){
  x <- paste0(x,collapse = '\n')
  class(x) <- 'character'
  cat(x)
}

#' @export
print.texpreview_input <- function(x,...){
  x <- paste0(x,collapse = '\n')
  class(x) <- 'character'
  cat(x)
}
