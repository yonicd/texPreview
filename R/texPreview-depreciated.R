#' @export
getTexPackages <- function(pkg,options=NULL,uselibrary=NULL,chk.inst=FALSE){
  .Deprecated('get_texpackages','texPreview',old = 'getTexPackages')
  get_texpackages()
}

#' @export
buildUsepackage <- function(pkg,options=NULL,uselibrary=NULL,chk.inst=FALSE){
  .Deprecated('build_usepackage','texPreview',old = 'buildUsepackage')
  build_usepackage(pkg,options,uselibrary,chk.inst)
}

#' @export
texPreview <- function(
  obj, 
  tex_lines = NULL,
  stem = NULL,
  fileDir = tex_opts$get('fileDir'), 
  overwrite = TRUE, 
  margin = tex_opts$get('margin'),
  imgFormat = tex_opts$get('imgFormat'), 
  returnType = tex_opts$get('returnType'),
  resizebox = tex_opts$get('resizebox'),
  usrPackages = NULL,
  engine = tex_opts$get('engine'),
  cleanup = tex_opts$get('cleanup'),
  keep_pdf = FALSE, 
  tex_message = FALSE, 
  density = tex_opts$get('density'),
  svg_max = tex_opts$get('svg_max'),
  print.xtable.opts = tex_opts$get('print.xtable.opts'),
  opts.html = tex_opts$get('opts.html'),
  ...
){
  .Deprecated('tex_preview','texPreview',old = 'texPreview')
  tex_preview(obj, 
              tex_lines,
              stem,
              fileDir, 
              overwrite, 
              margin,
              imgFormat, 
              returnType,
              resizebox,
              usrPackages,
              engine,
              cleanup,
              keep_pdf, 
              tex_message, 
              density,
              svg_max,
              print.xtable.opts,
              opts.html,
              ...)
}