wenv <- new.env()

wenv_init <- function(){
    assign('tex'   , FALSE ,envir = wenv)
    assign('get'   , FALSE ,envir = wenv)
    assign('build' , FALSE ,envir = wenv)
}

.onLoad <- function(lib,pkg) {
  wenv_init()
  if(interactive()){
    check_requirments()
    rc.options(custom.completer = completeme)
    register_completion(thispkg = populate) 
  }
  register_eng_texpreview('texpreview', eng_texpreview)
}


.onAttach <- function(lib,pkg) {
  wenv_init()
  if(interactive()){
    check_requirments()
    rc.options(custom.completer = completeme)
    register_completion(thispkg = populate) 
  }
}