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
    return(invisible(NULL))
  
  thispath <- normalizePath(file.path(fileDir, paste0(stem,".", imgFormat)),mustWork = FALSE)
  
  magick::image_write(imgOut, thispath,flatten = TRUE)
  
  if(file.info(thispath)['size']>tex_opts$get('svg_max')&returnType=='viewer'){
    stop(sprintf(
      'svg file size too big (%smb) for viewer try a different device to preview',
      round(as.numeric(file.info(thispath)['size'])/1000000,1)
      )
    )
  }
    
    if(imgFormat=='svg'&'svgPanZoom'%in%rownames(utils::installed.packages())){

      if(returnType=='viewer'){
        
        xmlSvg <- paste0(readLines(thispath),collapse = '\n')
        
        return(print(svgPanZoom::svgPanZoom(xmlSvg)))  
      }
      
    }
      
    if(returnType=='viewer'){

        htmltools::html_print(
          htmltools::tags$img(
            src = sprintf("data:image/%s;base64,%s",imgFormat,base64enc::base64encode(thispath)),
            width='100%'
          ),
          viewer = getOption("viewer")
        )
        
      }
      
}