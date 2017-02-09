#' @title Build usepackage command for TeX document
#' @export
#' @description input TeX package name and optional package functions to create usepackage call
#' @param pkg character, name of TeX package
#' @param opts character, name(s) of functions to call in the package 
#' @details opts is an optional argument, if it is NULL (default) then only the call for the package is returned.
#' See the TeX wikibook for more information \url{https://en.wikibooks.org/wiki/LaTeX/Document_Structure#Packages} on 
#' the usepackage command
#' @return 
#' character
#' @examples
#' buildUsepackage(pkg = 'xcolor')
#' buildUsepackage(pkg = 'xcolor',opts = 'usenames')
#' 
#' #build many at once using mapply
#' mapply(buildUsepackage,pkg=list('xcolor','multrow','helvet','amsmath','rotating','graphicx'),
#' opts=list(c('usenames','dvispnames','svgnames','table'),NULL,NULL,NULL,NULL,NULL))

buildUsepackage=function(pkg,opts=NULL){
    if(!is.null(opts)){
      sprintf('\\usepackage[%s]{%s}',paste0(opts,collapse=','),pkg)
    }else{
      sprintf('\\usepackage{%s}',pkg)
    } 
}