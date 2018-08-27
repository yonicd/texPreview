#' @importFrom magick image_convert image_read image_write
tex_image <- function(
  obj,
  stem = "tex_temp",
  writeFlg, 
  overwrite,
  fileDir = tex_opts$get('fileDir'),
  density = tex_opts$get('density'),
  imgFormat = tex_opts$get('imgFormat'),
  print.xtable.opts = tex_opts$get('print.xtable.opts')
  ){
  
  imgOut <- magick::image_convert(
    image =  magick::image_read(
      path = file.path(fileDir, paste0(stem, "Doc.pdf")),
      density = density),
    format = imgFormat, 
    depth = 16
  )
  
  if (writeFlg & overwrite) {
    
    magick::image_write(
      imgOut, 
      file.path(fileDir, paste0(stem,".", imgFormat))
    )
    
    if (!"file" %in% names(print.xtable.opts)){ 
      
      print.xtable.opts$file <- file.path(fileDir, paste0(stem,".tex"))
      
    }
    
    if ("xtable" %in% class(obj)){
      do.call("print", print.xtable.opts)
    }
    
  }
  
  return(imgOut)
}