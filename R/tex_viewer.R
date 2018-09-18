#' @importFrom base64enc base64encode
#' @importFrom htmltools html_print tags
#' @importFrom xml2 read_xml
#' @importFrom utils installed.packages
#' @importFrom svgPanZoom svgPanZoom
#' @importFrom magick image_write
tex_viewer <- function(imgOut,
                       stem = "tex_temp",
                       fileDir = tex_opts$get('fileDir'),
                       returnType = tex_opts$get('returnType'),
                       imgFormat = tex_opts$get('imgFormat')){
  
  if(returnType=='shiny')
    return()
  
  thispath <- normalizePath(file.path(fileDir, paste0(stem,".", imgFormat)))
  
    if(imgFormat=='svg'&'svgPanZoom'%in%rownames(utils::installed.packages())){
      
      magick::image_write(imgOut, thispath)
      
      if(returnType=='viewer'){
        
        xmlSvg <- paste0(readLines(thispath),collapse = '\n')
        
        print(svgPanZoom::svgPanZoom(xml2::read_xml(xmlSvg)))
        
      }
      
    } else {
      
      if(!returnType%in%c('tex','beamer')){
        
        magick::image_write(imgOut, thispath)
        
        htmltools::html_print(
          htmltools::tags$img(
            src = sprintf("data:image/%s;base64,%s",imgFormat,base64enc::base64encode(thispath)),
            width='100%'
          ),
          viewer = getOption("viewer")
        )
        
      }
      
    } 
}