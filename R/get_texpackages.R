#' @title Get list of TeX packages installed on System
#' @export
#' @description Fetch all TeX packages currently installed on system
#' @details If OS is Windows function checks against MikTex else function checks against TexLive.
#' @return 
#' character
#' @examples
#' \dontrun{head(get_texpackages())}
#' @concept utils
#' @rdname get_texpackages
get_texpackages <- function(){
  
  if(nzchar(Sys.which("tlmgr"))){
    
    x <- system('tlmgr list --only-installed',intern = TRUE)
    
    gsub('^i |:(.*?)$','',x)
    
  }else{
    
    if(!nzchar(Sys.which("mpm"))){
      system('mpm --list-package-names',intern = TRUE)
    }else{
      stop('neither tlmgr or mpm are installed and in %PATH%')
    }
    
  }
  
}
