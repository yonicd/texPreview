parse_log <- function(obj){
  
  idx <- grep('[!]',obj)
  err <- obj[idx[1]:idx[2]]
  idy <- grep("Here is how much of TeX's memory you used",err)
  paste0(c(' ',gsub('\\s+',' ',err[1:(idy-1)]),err[length(err)]),collapse = '\n')
  
}

#' @importFrom rstudioapi callFun
make_marker <- function(stem,txt,fileDir = tex_opts$get('fileDir')){
  
  x <- list(
    file = file.path(fileDir,sprintf('%sDoc.log',stem)),
    line = grep('[!]',txt)[1],
    column = 1,
    message = grep('[!]',txt,value = TRUE)[1],
    type    = 'error'
    )
  
  rstudioapi::callFun("sourceMarkers",
                      name = stem,
                      markers = list(x),
                      basePath = fileDir,
                      autoSelect = "none")
}