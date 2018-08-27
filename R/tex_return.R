tex_return <- function(
  obj,
  stem = "tex_temp",
  dev = 'tex',
  returnType = tex_opts$get('returnType'),
  fileDir = tex_opts$get('fileDir'),
  opts.html = tex_opts$get('opts.html')
  ){
  
  path <- tex_path(fileDir,stem,dev)
  
  if(returnType=='viewer') {
    return(NULL)
  }
  
  if(returnType%in%c("html", "html5", "s5", "slidy","slideous", "dzslides", "revealjs","md")){
    return(
      writeLines(sprintf('<img src="%s" height="%s" width="%s" />',
                   path,opts.html$height,
                   opts.html$width)
           )
    )
  } 
  
  if(grepl('^input',returnType)){
    cat(obj, file = path, sep= '\n')
    return(
      writeLines(sprintf('\\input{%s}',path))
    )
  }
  
  if(returnType%in%c('tex','beamer')){
    cat(obj, file = path, sep= '\n')
    return(obj)
  }
  
}

tex_path <- function(fileDir,stem,dev = 'tex'){
  
  file.path(fileDir, sprintf("%s.%s",stem,dev))
  
}