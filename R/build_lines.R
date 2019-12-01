#' @importFrom whisker whisker.render
build_lines <- function(obj,
                        stem = "tex_temp",
                        usrPackages,
                        fileDir = tex_opts$get('fileDir'),
                        resizebox = tex_opts$get('resizebox'),
                        margin = tex_opts$get('margin')
                        ){
  
  if( resizebox ){
      
    obj <- tex_resize(obj)
      
  }
  
  obj <- clean_packages(obj)

  usrPackages <- union(usrPackages,texPreview::build_usepackage(attr(obj,'packages')))
  
  cat(obj, file= tex_path(fileDir,stem), sep= '\n')
  
  TMPL <- readLines(system.file('tmpl.tex',package = 'texPreview'))
  
  input_path <- normalizePath(tex_path(fileDir,stem),winslash = .Platform$file.sep)
  
  input_path <- sprintf('{%s}',input_path)
  
  ARGS <- append(margin, list(usrPackages = paste0(usrPackages,collapse = '\n'), file = input_path))
  
  whisker::whisker.render(TMPL, ARGS)
}