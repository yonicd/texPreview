tex_dir_setup <- function(fileDir = tex_opts$get('fileDir'),
                          returnType = tex_opts$get('returnType')){
  
  err <- getOption('error')
  
  options(error = function() {NULL})
  options(show.error.messages=FALSE)
  
  on.exit({
    options(error = err)
    options(show.error.messages=TRUE)
  },add = TRUE)
  
  if (is.null(fileDir)) {
    
    fileDir <- tempdir()
    
    if (!dir.exists(fileDir)) 
      dir.create(fileDir, recursive = TRUE,showWarnings = FALSE)
    
    writeFlg <- FALSE
    
  } else {
    
    writeFlg <- TRUE
    
    if (!dir.exists(fileDir)){
      
      if(returnType=='viewer') 
        stop()
      
    }else{
      
      dir.create(fileDir, recursive = TRUE,showWarnings = FALSE)
      
    }
    
  }
  
  tex_opts$set('fileDir' = fileDir)
  
  return(writeFlg)
 
}
