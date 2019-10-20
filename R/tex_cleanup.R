tex_cleanup <- function(
  cleanup,
  stem,
  keep_pdf,
  keep_log = FALSE,
  fileDir = tex_opts$get('fileDir')){
  
  if( !is.null(cleanup) ){
    
    tempDel <- list.files(
      fileDir,
      sprintf('%s(.*?)(%s)',stem,paste0(cleanup,collapse ='|')),
      full.names = TRUE)
    
    if(keep_log){
      
      tempDel <- tempDel[!grepl('log$',tempDel)]
      
    }
    
    if(keep_pdf){
      
      tempDel <- tempDel[!grepl('pdf$',tempDel)]
      
    }
    
    unlink(tempDel)
    
  }
  
}
