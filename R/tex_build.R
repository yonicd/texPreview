#' @importFrom tinytex latexmk
tex_build <- function(tex_lines,
                      stem = "tex_temp",
                      tex_message,
                      fileDir = tex_opts$get('fileDir'),
                      engine = tex_opts$get('engine'),
                      ...){
  
  cwd <- getwd()
  
  on.exit({setwd(cwd)},add = TRUE)
  
  setwd(fileDir)
  
  temp_tex    <- sprintf("%sDoc.tex",stem)
  temp_log    <- sprintf('%sDoc.log',stem)
  
  writeLines(tex_lines, con = temp_tex)
  
  tinytex::latexmk(file        = temp_tex, 
                   engine      = engine,
                   engine_args = '-synctex=1',
                   clean       = FALSE,
                   ...)
  
  log_lines <- readLines(temp_log)
  
  attr(log_lines,'error') <- grepl('error',log_lines[length(log_lines)])

  log_lines
  
}
