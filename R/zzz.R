check_requirments <- function(){
  
  chk <- sapply(tex_pkgs,check_package)
  
  if(!all(chk)){
    warning(sprintf('missing tex packages needed for texPreview: %s', paste0(names(chk)[!chk],collapse = ', ')))
  }  
  
  chk
}

.onLoad <- function(lib,pkg) {
  if(interactive()){
    check_requirments()
    rc.options(custom.completer = completeme)
    register_completion(thispkg = populate) 
  }
}

.onAttach <- function(lib,pkg) {
  if(interactive()){
    check_requirments()
    rc.options(custom.completer = completeme)
    register_completion(thispkg = populate) 
  }
}