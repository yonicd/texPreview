tex_cleanup <- function(
  cleanup,
  stem,
  keep_pdf,
  fileDir = tex_opts$get('fileDir')){
  
  if( !is.null(cleanup) ){
    
    tempDel <- list.files(fileDir,sprintf('%s(.*?)(%s)',stem,paste0(cleanup,collapse ='|')),full.names = TRUE)
    
    if(keep_pdf){
      
      tempDel<- tempDel[-grep('pdf',tempDel)]
      
    }
    
    unlink(tempDel)
    
  }
  
}
