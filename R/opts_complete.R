#borrowed main bits from https://github.com/jimhester/completeme (when it is put on CRAN will import directly from it)

the <- new.env(parent = emptyenv())
the$completions <- list()
complete_token <- get(".completeToken", asNamespace("utils"))

# Register completion functions
#
# Completion functions should take one parameter `env`, the completion
# environment, see `?rc.settings` for details of this environment. They should
# simply return any completions found or `return(NULL)` otherwise.
#
# If all registered completions do not have any completions for a given
# context, than R's standard completions are used.
# @param ... One or more completion functions specified as named parameters.
register_completion <- function(...) {
  funs <- list(...)
  
  nms <- names(funs)
  if (is.null(nms) || any(nms == "" | is.na(nms))) {
    wch <- if (is.null(nms)) 1 else which(nms == "" | is.na(nms))
    stop("All arguments must be named")
  }
  
  old <- the$completions
  the$completions <- modifyList(the$completions, funs)
  
  invisible(old)
}

#' @importFrom utils rc.options
#' @importFrom rlang %||%
completeme <- function(env) {
  env$fileName <- FALSE
  for (fun in the$completions) {
    env$comps <- fun(env)
    if (length(env$comps) > 0) {
      attributes(env$comps) <- list(class = "completions", type = attr(env$comps, "type") %||% 15)
      return(invisible(env$comps))
    }
  }
  
  env$comps <- character()
  
  # if in the IDE, throw an error to fallback on normal completion
  if (rstudioapi::isAvailable()) {
    abort("No custom completions", type = "no_completions")
  }
  
  # If on the command line, fall back to using the default completer
  on.exit(rc.options(custom.completer = completeme))
  rc.options(custom.completer = NULL)
  complete_token()
  
  invisible(env$comps)
}

#' @importFrom rematch2 re_match
current_function <- function(env) {
  buffer <- env[["linebuffer"]]
  fun <- rematch2::re_match(buffer, "(?<fun>[^[:space:](]+)[(][^(]*$")$fun
  if (is.na(fun)) {
    return("")
  }
  fun
}

populate <- function(env){
  
  fun <- current_function(env)
  
  this_ns <- environmentName(parent.env(environment()))
    
  this_fn <- ls(envir = asNamespace(this_ns),pattern = 'opts$')
  
  nms <- names(get(this_fn)$get())
  
  comp <- NULL
  
  if(length(fun) > 0){

       if(fun %in% c(sprintf('%s::%s$set',this_ns,this_fn),
                   sprintf('%s$set',this_fn),
                   sprintf('%s::%s$append',this_ns,this_fn),
                   sprintf('%s$append',this_ns,this_fn)
                   )){
         comp = nms
        }
    
  }
  
  return(comp)
  
}