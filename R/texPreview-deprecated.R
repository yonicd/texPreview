#' @title Get list of TeX packages installed on System \lifecycle{deprecated}
#' @description This function has been deprecated, use [get_texpackages][texPreview::get_texpackages] instead.
#' @inheritParams get_texpackages
#' @importFrom lifecycle deprecate_warn
#' @rdname getTexPackages
#' @export
getTexPackages <- function(){
  lifecycle::deprecate_warn('1.3.0',
                            what = 'texPreview::getTexPackages()',
                            with = 'texPreview::get_texpackages()')
  get_texpackages()
}

#' @title Build usepackage command for TeX document \lifecycle{deprecated}
#' @description This function has been deprecated, use [build_usepackage][texPreview::build_usepackage] instead.
#' @inheritParams build_usepackage
#' @importFrom lifecycle deprecate_warn
#' @rdname BuildUsepackage
#' @export
buildUsepackage <- function(pkg,options=NULL,uselibrary=NULL,chk.inst=FALSE){
  lifecycle::deprecate_warn('1.3.0',
                            what = 'texPreview::buildUsepackage()',
                            with = 'texPreview::build_usepackage()')
  
  build_usepackage(pkg,options,uselibrary,chk.inst)
}

#' @title Render and Preview snippets of TeX in R Viewer \lifecycle{deprecated}
#' @description This function has been deprecated, use [tex_preview][texPreview::tex_preview] instead.
#' @inheritParams tex_preview
#' @rdname texPreview
#' @importFrom lifecycle deprecate_warn
#' @export
texPreview <- function(
  obj, 
  tex_lines         = NULL,
  stem              = "tex_temp",
  overwrite         = TRUE,
  keep_pdf          = FALSE, 
  tex_message       = FALSE,  
  fileDir           = tex_opts$get('fileDir'), 
  margin            = tex_opts$get('margin'),
  imgFormat         = tex_opts$get('imgFormat'), 
  returnType        = tex_opts$get('returnType'),
  resizebox         = tex_opts$get('resizebox'),
  usrPackages       = tex_opts$get('usrPackages'),
  engine            = tex_opts$get('engine'),
  cleanup           = tex_opts$get('cleanup'),
  density           = tex_opts$get('density'),
  svg_max           = tex_opts$get('svg_max'),
  print.xtable.opts = tex_opts$get('print.xtable.opts'),
  opts.html         = tex_opts$get('opts.html'),
  markers           = interactive(),
  ...
){
  
  lifecycle::deprecate_warn('1.3.0',
                            what = 'texPreview::texPreview()',
                            with = 'texPreview::tex_preview()')
  
  tex_preview(obj,tex_lines,stem,overwrite,keep_pdf,
              tex_message,fileDir,margin,
              imgFormat,returnType,resizebox,usrPackages,
              engine,cleanup,density,svg_max,
              print.xtable.opts,opts.html,markers,...)
}