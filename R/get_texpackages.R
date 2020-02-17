#' @title Get list of TeX packages installed on System
#' @export
#' @description Fetch all TeX packages currently installed on system
#' @details If OS is Windows function checks against MikTex else function checks against TexLive.
#' @return 
#' character
#' @examples
#' #head(get_texpackages())
#' @concept utils
#' @rdname get_texpackages
get_texpackages <- function(){
  
  if (Sys.info()[1] == "Windows"){
    
    if(length(system('mpm --version',intern = TRUE))==0)
      stop('mpm not installed')
    
    system('mpm --list-package-names',intern = TRUE)
    
  }else{
    
    if(length(system('tlmgr --version',intern = TRUE))==0)
      stop('tex live not installed')
    
    x <- system('tlmgr list --only-installed',intern = TRUE)
    
    gsub('^i |:(.*?)$','',x)
    
  }
}
