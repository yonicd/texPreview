#' @title Build usepackage command for TeX document
#' @export
#' @description input TeX package name and optional package functions to create usepackage call
#' @param pkg character, name of TeX package
#' @param options character, name(s) of options to use in the package 
#' @param uselibrary character, part of document preamble to specify a uselibrary call related to package
#' @param chk.inst logical, invokes a check to see if pkg is currently installed on system (default FALSE)
#' @details if options and uselibrary are NULL (default) then only the call for the package is returned.
#' See the TeX wikibook for more information \url{https://en.wikibooks.org/wiki/LaTeX/Document_Structure#Packages} on 
#' the usepackage command. If chk.inst finds that the package is not installed on system function returns NULL.
#' @return 
#' character
#' @examples
#' buildUsepackage(pkg = 'xcolor')
#' buildUsepackage(pkg = 'xcolor',options = 'usenames')
#' 
#' #build many at once using mapply
#' 
#' geom.opts=c('paperwidth=35cm','paperheight=35cm','left=2.5cm','top=2.5cm')
#' use.opts="\\usetikzlibrary{mindmap,backgrounds}"
#' 
#' unlist(mapply(buildUsepackage,
#' pkg =        list('times','geometry','tikz'),
#' options=     list(NULL   ,geom.opts ,NULL),
#' uselibrary = list(NULL   ,NULL      ,use.opts)
#' ))

buildUsepackage=function(pkg,options=NULL,uselibrary=NULL,chk.inst=FALSE){
  if( chk.inst ){
    if ( Sys.info()[1] == "Windows" ){
      x <- length(shell(sprintf("mpm --list-package-names | grep %s",pkg),intern=TRUE))>0
    }else{
      x <- grepl('Yes',system(sprintf('tlmgr list --only-installed %s | grep installed',pkg),intern=TRUE))
    }
    
    if( !x ){
      warning(sprintf("package '%s' not installed",pkg))
      return(NULL)
    } 
  }

    if( !is.null(options) ){
      out <- sprintf('\\usepackage[%s]{%s}',paste0(options,collapse=','),pkg)
    }else{
      out <- sprintf('\\usepackage{%s}',pkg)
    }
  
    return( c(out,uselibrary) )
}