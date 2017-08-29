#' @importFrom rstudioapi getActiveDocumentContext
texAddin <- function() {
  # Get the document context.
  context <- rstudioapi::getActiveDocumentContext()
  
  # Set the default data to use based on the selection.
  obj <- context$selection[[1]]$text
  
  if (nchar(obj) == 0) {
    stop('Please highlight a tex before selecting this addin.')
  }
  
  if(grepl('xtable',obj)){
    eval(parse(text=paste0('obj=',obj)))
  }else{
    obj=gsub('\\\\\\\\','\\\\',obj)
  } 
  
  texPreview(obj = obj)
}