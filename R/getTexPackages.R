#' @title Get list of TeX packages installed on System
#' @export
#' @description Fetch all TeX packages currently installed on system
#' @details If OS is Windows function checks against MikTex else function checks against TexLive.
#' @return 
#' character
#' @examples
#' head(getTexPackages())

getTexPackages=function(){
  if (Sys.info()[1] == "Windows"){
    system('mpm --list-package-names',intern = T)
  }else{
    x=system('tlmgr list --only-installed',intern = T)
    x=gsub('^i ','',x)
    xl=strsplit(x,':')
    sapply(xl,'[',1)
  }
}