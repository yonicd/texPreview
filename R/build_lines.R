#' @importFrom whisker whisker.render
build_lines <- function(obj,
                        stem = "tex_temp",
                        usrPackages,
                        fileDir = tex_opts$get('fileDir'),
                        resizebox = tex_opts$get('resizebox'),
                        margin = tex_opts$get('margin'),
                        print.xtable.opts = tex_opts$get('print.xtable.opts')
                        ){
  
  if ("xtable" %in% class(obj)) {
    
    print.xtable.opts$x <- obj
    
    print.xtable.opts$comment <- FALSE
    
    if (!"file" %in% names(print.xtable.opts)) {
      
      print.xtable.opts$file <- file.path(fileDir, paste0(stem,".tex"))
      
    }
    
    tex_opts$set(print.xtable.opts = print.xtable.opts)
    
    obj <- do.call("print", print.xtable.opts)
    
  }
  
  if( resizebox ){
    
    obj <- gsub('\\\\begin\\{tabular\\}',
                '\\\\resizebox\\{\\\\textwidth\\}\\{!\\}\\{\\\\begin\\{tabular\\}',
                obj)
    
    obj <- gsub('\\\\end\\{tabular\\}',
                '\\\\end\\{tabular\\}\\}',
                obj)
    
  }
  
  cat(obj, file= file.path(fileDir, paste0(stem,".tex")), sep= '\n')
  
  TMPL <- readLines(system.file('tmpl.tex',package = 'texPreview'))
  
  ARGS <- append(margin, list(usrPackages = paste0(usrPackages,collapse = '\n'), file = file.path(fileDir,sprintf('%s.tex',stem))))
  
  whisker::whisker.render(TMPL, ARGS)
}