`%n%` <- function (x, y){
  if (is.null(x)) y else x  
}

#' @importFrom utils getFromNamespace
#' @importFrom htmltools html_print tags
#' @importFrom knitr engine_output sew
eng_texpreview <- function (options) {

  type <- options$type %n% "texpreview"
  options$type <- 'r'
  options$results <- 'asis'
  
  options$texpreview.return <- options$texpreview.return %n% 'engine'
  options$texpreview.path <- options$texpreview.path %n% tex_opts$get('fileDir')
  options$texpreview.stem <- options$texpreview.stem %n% "tex_temp"
  
  
  #reset return type to 'engine' to return safely
  if(options$texpreview.return%in%c('html','viewer')){
    
    message(sprintf("Use texpreview.return='engine' instead of '%s'",
                    options$texpreview.return))
    
    options$texpreview.return <- 'engine'
  }
   
  if(!options$texpreview.return%in%c('engine','input','tex'))
    stop(sprintf('Invalid value for options$texpreview.return choose one of the following: %s',paste0(sprintf("'%s'",c('engine','input','tex')),collapse = ', ')))
  
  if(length(options$code)>1){
    input_obj <- paste0(options$code,collapse = '\n')  
  }else{
    input_obj <- eval(parse(text = options$code))
  }
  
  output_code <- tex_preview(input_obj,
                     returnType = options$texpreview.return,
                     fileDir = options$texpreview.path,
                     stem = options$texpreview.stem)

  if(options$texpreview.return%in%c('engine','viewer','html')){
  
  
  plot_counter <- utils::getFromNamespace("plot_counter", "knitr")
  in_base_dir <- utils::getFromNamespace("in_base_dir", "knitr")

  tmp <- knitr::fig_path('png', number = plot_counter())
  tmp <- structure(tmp,class = c('knit_image_paths',class(tmp)))
  
  if(!grepl('^-',tmp)){
  
    in_base_dir({
      dir.create(dirname(tmp), showWarnings = FALSE, recursive = TRUE)
      file.copy(output_code,tmp,overwrite = TRUE)
    })

    code <- knitr::sew(tmp)

    output_code <- paste0(code,collapse = '\n')
    
    knitr::engine_output(options = options, code = options$code, out = output_code)
    
  }else{
    
    htmltools::html_print(htmltools::tags$img(
      src = sprintf("data:image/%s;base64,%s",'png',base64enc::base64encode(output_code)),
      width='100%'
    ))

    knitr::engine_output(options,code = options$code,out = '')
    
  }
  
  }else{
  
  knitr::engine_output(options = options, code = options$code, out = as.character(output_code))
    
  }
  
}

#' @importFrom stats setNames
#' @importFrom knitr knit_engines
register_eng_texpreview = function(envs, engine) {
  
  knitr::knit_engines$set(stats::setNames(lapply(envs, function(env) {
    function(options) {
      options$type = env
      engine(options)
    }
  }), envs))
}
