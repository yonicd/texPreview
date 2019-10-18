#' @title re-export magrittr pipe operators
#'
#' @importFrom magrittr %>%
#' @name %>%
#' @rdname pipe
#' @export
NULL


parse_log <- function(obj, lines = FALSE){
  
  idx <- grep('[!]',obj)
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

tex_pkgs <- function(file = system.file('tmpl.tex',package = 'texPreview'), lines = NULL){
  
  if(is.null(lines))
    lines <- readLines(file)
  
  x <- grep('\\usepackage',lines,value = TRUE)
  
  x <- gsub('\\[(.*?)\\]','',x)
  
  ret <- gsub('[{}]','',unlist(regmatches(x, gregexpr('\\{(.*?)\\}', x))))

  ret
  
}


tex_resize <- function(obj){
  
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

tex_sanitize <- function(x, token = '$'){
  
  for(i in token){
    x <- gsub(sprintf('\\%s',i),i,x,fixed = TRUE)  
  }
  
  x
}

clean_packages <- function(x){
  
  x <- strsplit(x,'\n')[[1]]
  
  ret <- paste0(x[!grepl('\\usepackage',x,fixed = TRUE)],collapse = '\n')
  
  structure(ret,packages = tex_pkgs(lines = x))
  
}

clean_table_env <- function(x){
  
  x <- gsub('\\\\begin\\{table\\}|\\\\end\\{table\\}','',x)
  gsub('\\\\caption\\{(.*?)\\}','',x)
  
}

fill_options <- function(x,y = tex_opts$get()){
  
  fill_not_all_names <- intersect(names(y),names(x))
  
  for(i in fill_not_all_names){
    if(inherits(y[[i]],'list')){
      
      fill_options(x[[i]],y[[i]])
      
    }else{
      y[[i]] <- x[[i]]
    }
    
  }
  
  return(y)
}
