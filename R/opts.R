# forked from https://github.com/yihui/knitr/blob/master/R/defaults.R
new_defaults = function(value = list()) {
  defaults = value
  
  get = function(name, default = FALSE, drop = TRUE) {
    if (default) defaults = value  # this is only a local version
    if (missing(name)) defaults else {
      if (drop && length(name) == 1) defaults[[name]] else {
        setNames(defaults[name], name)
      }
    }
  }
  resolve = function(...) {
    dots = list(...)
    if (length(dots) == 0) return()
    if (is.null(names(dots)) && length(dots) == 1 && is.list(dots[[1]]))
      if (length(dots <- dots[[1]]) == 0) return()
    dots
  }
  set = function(...) {
    dots = resolve(...)
    if (length(dots)) defaults <<- merge(dots)
    invisible(NULL)
  }
  merge = function(values) merge_list(defaults, values)
  restore = function(target = value) defaults <<- target
  append = function(...) {
    dots = resolve(...)
    for (i in names(dots)) dots[[i]] <- c(defaults[[i]], dots[[i]])
    if (length(dots)) defaults <<- merge(dots)
    invisible(NULL)
  }
  
  list(get = get, set = set, append = append, merge = merge, restore = restore)
}

#' Default and current tex options
#'
#' Options for functions in the texPreview package. When running R code, the object \code{tex_opts}
#' (default options) is not modified by chunk headers (local chunk options are
#' merged with default options), whereas \code{tex_opts_current} (current options)
#' changes with different chunk headers and it always reflects the options for
#' the current chunk.
#'
#' Normally we set up the global options once in the first code chunk in a
#' document using \code{tex_opts$set()}, so that all \emph{latter} chunks will
#' use these options. Note the global options set in one chunk will not affect
#' the options in this chunk itself, and that is why we often need to set global
#' options in a separate chunk.
#'
#' Below is a list of default chunk options, retrieved via
#' \code{tex_opts$get()}:
#'
#' These options correspond to fields in the direct call to \code{\link{texPreview}}, which are listed in explained
#' 
#' in the help manual.
#'
#' @note \code{tex_opts_current} is read-only in the sense that it does nothing if
#'   you call \code{tex_opts_current$set()}; you can only query the options via
#'   \code{tex_opts_current$get()}.
#' @export
#' @examples tex_opts$get('margin')
tex_opts = new_defaults(list(
  fileDir = NULL,
  margin = list(left = 10, top=5, right=10, bottom=5),
  imgFormat = "png",
  print.xtable.opts = list(),
  opts.html = list(width="100%",height="100%"),
  cleanup = c('aux','log','Doc'),
  engine = 'pdflatex',
  returnType = 'viewer',
  density = 150,
  resizebox=TRUE,
  bg_fill = 'white'
))

#' @rdname tex_opts
#' @export
tex_opts_current = new_defaults()

# merge elements of y into x with the same names
merge_list = function(x, y) {
  x[names(y)] = y
  x
}

setNames<-function(object = nm, nm){
  names(object) <- nm
  object
}
