`%n%` <- function (x, y){
  if (is.null(x)) y else x  
}

#' @importFrom utils getFromNamespace
eng_texpreview <- function (options) {
  
  type <- options$type %n% "texpreview"
  options$type <- 'r'

  options$texpreview.return <- options$texpreview.return %n% 'engine'
  options$texpreview.path <- options$texpreview.path %n% tex_opts$get('fileDir')
  options$texpreview.stem <- options$texpreview.stem %n% "tex_temp"
  
  if(length(options$code)>1){
    input_obj <- paste0(options$code,collapse = '\n')  
  }else{
    input_obj <- eval(parse(text = options$code))
  }
  
  output_code <- tex_preview(input_obj,
                     returnType = options$texpreview.return,
                     fileDir = options$texpreview.path,
                     stem = options$texpreview.stem)

  if(options$texpreview.return=='engine'){
  
  wrap_path <- utils::getFromNamespace('wrap.knit_image_paths','knitr')
  plot_counter <- utils::getFromNamespace("plot_counter", "knitr")
  in_base_dir <- utils::getFromNamespace("in_base_dir", "knitr")

  tmp <- knitr::fig_path('png', number = plot_counter())
  
  if(!grepl('^-',tmp)){
  
    in_base_dir({
      dir.create(dirname(tmp), showWarnings = FALSE, recursive = TRUE)
      file.copy(output_code,tmp,overwrite = TRUE)
    })
    
    code <- wrap_path(tmp)
      
    if(options$echo){
      echo_code <- sprintf('```r\n%s\n```',paste0(options$code,collapse = '\n'))
      options$code <- paste0(c(echo_code,code),collapse = '\n')
    }else{
      options$code <- paste0(code,collapse = '\n')  
      options$echo <- TRUE
    }
    
    utils::getFromNamespace('eng_asis','knitr')(options)
    
  }else{

    htmltools::html_print(htmltools::tags$img(
        src = sprintf("data:image/%s;base64,%s",'png',base64enc::base64encode(output_code)),
        width='100%'
      ))
    
    knitr::engine_output(options = options, code = options$code, out = '')
    
  }
  
  }else{
  
  options$results <- 'asis'
  knitr::engine_output(options = options, code = options$code, out = as.character(output_code))
    
  }
  
}

#' @importFrom stats setNames
register_eng_texpreview = function(envs, engine) {
  knitr::knit_engines$set(stats::setNames(lapply(envs, function(env) {
    function(options) {
      options$type = env
      engine(options)
    }
  }), envs))
}
