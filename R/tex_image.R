#' @importFrom magick image_convert image_read image_write image_background
tex_image <- function(
  obj,
  stem = "tex_temp",
  write_flag, 
  overwrite,
  fileDir = tex_opts$get('fileDir'),
  density = tex_opts$get('density'),
  imgFormat = tex_opts$get('imgFormat')
  ){
  
  if('pdftools'%in%rownames(installed.packages())){
    readfn <- magick::image_read_pdf
  }else{
    readfn <- magick::image_read
  }

  pdf_path <- tex_path(fileDir,paste0(stem,'Doc'),dev = 'pdf')
  
  if(!file.exists(pdf_path)){
    log_path <- tex_path(fileDir,paste0(stem,'Doc'),dev = 'log')
    print(readLines(log_path))
    stop('pdf not rendered')
  }
  
  this_image <- readfn(path = pdf_path, density = density)
    
  imgOut <- magick::image_convert(this_image,format = imgFormat, depth = 16)
  
  if (write_flag & overwrite) {
    
    magick::image_write(imgOut, tex_path(fileDir,stem,dev = imgFormat))
    
  }
  
  return(imgOut)
}