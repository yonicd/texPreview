#' @title Build usepackage command for TeX document
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
#' build_usepackage(pkg = 'xcolor')
#' build_usepackage(pkg = 'xcolor',options = 'usenames')
#' 
#' #build many at once using mapply
#' 
#' geom.opts=c('paperwidth=35cm','paperheight=35cm','left=2.5cm','top=2.5cm')
#' use.opts="\\usetikzlibrary{mindmap,backgrounds}"
#' 
#' unlist(mapply(build_usepackage,
#' pkg =        list('times','geometry','tikz'),
#' options=     list(NULL   ,geom.opts ,NULL),
#' uselibrary = list(NULL   ,NULL      ,use.opts)
#' ))
#' @export
#' @concept utils
#' @rdname build_usepackage
#' @aliases buildUsepackage
build_usepackage=function(pkg,options=NULL,uselibrary=NULL,chk.inst=FALSE){
  if( chk.inst ){
    if( !check_package(pkg) ){
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


check_package <- function(x){
  if ( Sys.info()[1] == "Windows" ){
    check_mpm(x)
  }else{
    check_texlive(x)
  }
}

check_texlive <- function(x) length(suppressWarnings(system(sprintf('kpsewhich %s.sty',x),intern = TRUE)))>0
check_mpm <- function(x) length(shell(sprintf("mpm --list-package-names | grep %s",x),intern=TRUE))>0
