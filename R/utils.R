#' @title re-export magrittr pipe operators
#'
#' @importFrom magrittr %>%
#' @name %>%
#' @rdname pipe
#' @export
NULL


parse_log <- function(obj, lines = FALSE){
  
  idx <- range(grep('[!]',obj))
  err_lines <- idx[1]:idx[2]
  err <- obj[err_lines]
  idy <- grep("Here is how much of TeX's memory you used",err)
  
  if(lines){
    
    data.frame(
      line = err_lines[1:(idy-2)],
      message = err[1:(idy-2)],
      stringsAsFactors = FALSE
      )
    
  }else{
    
    paste0(c(' ',gsub('\\s+',' ',err[1:(idy-1)]),err[length(err)]),collapse = '\n')  
    
  }
  
  
  
}

#' @importFrom rstudioapi callFun
make_marker <- function(stem,txt,fileDir = tex_opts$get('fileDir')){
  
  x <- parse_log(txt, TRUE)
  
  x$file   = file.path(fileDir,sprintf('%sDoc.log',stem))
  x$column = 1
  x$type   = 'error'
  
  new_x <- split(x,x$line)
  
  y <- lapply(new_x,as.list)
  names(y) <- NULL
  
  rstudioapi::callFun("sourceMarkers",
                      name = stem,
                      markers = y,
                      basePath = fileDir,
                      autoSelect = "none")
}

tex_resize <- function(obj){
  
  if(grepl('\\\\resizebox\\{',obj))
    return(obj)
  
  obj <- gsub(
    '\\\\begin\\{tabular\\}',
    '\\\\resizebox\\{\\\\textwidth\\}\\{!\\}\\{
\\\\begin\\{tabular\\}',
    obj)
  
  obj <- gsub(
    '\\\\end\\{tabular\\}',
    '\\\\end\\{tabular\\}
\\}',
    obj)
  
}

clean_packages <- function(x){
  
  x <- strsplit(x,'\n')[[1]]
  
  ret <- paste0(x[!grepl('\\usepackage',x,fixed = TRUE)],collapse = '\n')
  
  structure(ret,packages = tex_requirements(lines = x,file = NULL))
  
}

tex_path <- function(fileDir,stem,dev = 'tex'){
  
  file.path(fileDir, sprintf("%s.%s",stem,dev))
  
}

is_inst <- function(pkg) {
  length(find.package(pkg,quiet = TRUE))>0
}


#' @importFrom details use_details
NULL
