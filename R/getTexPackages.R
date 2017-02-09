#' @title Get list of TeX packages installed on System
#' @export
#' @description Fetch all TeX packages currently installed on system
#' @details If OS is Windows function checks against MikTex else function checks against TexLive.
#' @return 
#' data.frame
#' @examples
#' head(getTexPackages())

getTexPackages=function(){
  x=c()

  if (Sys.info()[1] == "Windows"){
    x=system('mpm --list',intern = T)
  }else{
    x=system('tlmgr list --only-installed',intern = T)
  }

  if(length(x)==0) return('No texLive Packages installed')
  x=gsub('^i ','',x)
  xl=strsplit(x,':')
  xl1=sapply(xl,'[',1)
  xl2=sapply(xl,'[',2)
  df.out=data.frame(name=xl1,description=xl2)
  return(df.out)
}