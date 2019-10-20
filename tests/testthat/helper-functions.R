skip_on_windows <- function () {
  if (identical(.Platform$OS.type, "unix")) {
    return(invisible(TRUE))
  }
  skip("Non Unix")
}

cleanup <- function(path, create = TRUE){
  
  unlink(path,recursive = TRUE,force = TRUE)
  
  tex_opts$restore()
  
  if(create)
    
    dir.create(path)
  
}