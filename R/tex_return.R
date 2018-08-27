tex_return <- function(obj,returnType,fileDir,stem,dev = 'tex',opts.html){
  
  path <- tex_path(fileDir,stem,dev)
  
  if(returnType=='viewer') {
    return(NULL)
  }
  
  if(returnType%in%c("html", "html5", "s5", "slidy","slideous", "dzslides", "revealjs","md")){
    return(sprintf('<img src="%s" height="%s" width="%s" />', path,opts.html$height, opts.html$width))
  } 
  
  if(grepl('^input_',returnType)){
    cat(obj, file = path, sep= '\n')
    return(sprintf('\input{%s}',path))
  }
  
  if(returnType%in%c('tex','beamer')){
    cat(obj, file = path, sep= '\n')
    return(obj)
  }
  
}

tex_path <- function(fileDir,stem,dev = 'tex'){
  
  file.path(fileDir, sprintf("%s.%s",stem,dev))
  
}