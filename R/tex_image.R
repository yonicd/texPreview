#' @importFrom magick image_convert image_read image_write image_background
tex_image <- function(
  obj,
  stem = "tex_temp",
  write_flag, 
  overwrite,
  fileDir = tex_opts$get('fileDir'),
  density = tex_opts$get('density'),
  imgFormat = tex_opts$get('imgFormat'),
  print.xtable.opts = tex_opts$get('print.xtable.opts')
  ){
  
  if('pdftools'%in%rownames(installed.packages())){
    readfn <- magick::image_read_pdf
  }else{
    readfn <- magick::image_read
  }

  this_image <- try(readfn(path = file.path(fileDir, paste0(stem, "Doc.pdf")), density = density))
    
  imgOut <- magick::image_convert(this_image,format = imgFormat, depth = 16)
  
  if (write_flag & overwrite) {
    
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