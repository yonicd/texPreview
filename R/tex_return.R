#' @importFrom magick image_scale image_read
tex_return <- function(obj,
                       stem = "tex_temp",
                       dev = 'tex',
                       img_format = tex_opts$get('imgFormat'),
                       returnType = tex_opts$get('returnType'),
                       fileDir = tex_opts$get('fileDir'),
                       opts.html = tex_opts$get('opts.html')){
  
  path <- tex_path(fileDir,stem,dev)

  switch(returnType,
         
         'viewer' = {invisible(NULL)},
         
         'engine' = {
           tex_path(fileDir,stem,img_format)
         },
         
         'html'   = {
           magick::image_scale(
            magick::image_read(tex_path(fileDir,stem,img_format)),
            paste(opts.html,collapse = 'x')
           )
         },
         
         'input'  = {
           cat(obj, file = path, sep= '\n')
           ret <- sprintf('\\input{%s}',path)
           structure(ret, class = sprintf('texpreview_%s',returnType))
         },
         
         'tex'  = {
           cat(obj, file = path, sep= '\n')
           structure(obj, class = sprintf('texpreview_%s',returnType))
         }
         
         )

}
