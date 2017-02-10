#' @title Build usepackage command for TeX document
#' @export
#' @description input TeX package name and optional package functions to create usepackage call
#' @param pkg character, name of TeX package
#' @param options character, name(s) of options to use in the package 
#' @param uselibrary character, part of document preamble to specify a uselibrary call related to package
#' @param chk.pkg logical, invokes a check to see if pkg is currently installed on system (default FALSE)
#' @details opts is an optional argument, if it is NULL (default) then only the call for the package is returned.
#' See the TeX wikibook for more information \url{https://en.wikibooks.org/wiki/LaTeX/Document_Structure#Packages} on 
#' the usepackage command. If chk.pkg finds that the package is not installed on system function returns NULL.
#' @return 
#' character
#' @examples
#' buildUsepackage(pkg = 'xcolor')
#' buildUsepackage(pkg = 'xcolor',opts = 'usenames')
#' 
#' #build many at once using mapply
#' mapply(buildUsepackage,pkg=list('xcolor','multrow','helvet','amsmath','rotating','graphicx'),
#' opts=list(c('usenames','dvispnames','svgnames','table'),NULL,NULL,NULL,NULL,NULL))

buildUsepackage=function(pkg,options=NULL,uselibrary=NULL,chk.inst=FALSE){
  if(chk.inst){
    if (Sys.info()[1] == "Windows"){
      x=length(shell(sprintf("mpm --list-package-names | grep %s",pkg),intern=T))>0
    }else{
      x=grepl('Yes',system(sprintf('tlmgr list --only-installed %s | grep installed',pkg),intern=T))
    }
    
    if(!x){
      warning(sprintf("package '%s' not installed",pkg))
      return(NULL)
    } 
  }

    if(!is.null(options)){
      out=sprintf('\\usepackage[%s]{%s}',paste0(options,collapse=','),pkg)
    }else{
      out=sprintf('\\usepackage{%s}',pkg)
    }
  
    return(c(out,uselibrary))
}