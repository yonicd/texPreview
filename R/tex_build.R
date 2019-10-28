tex_build <- function(tex_lines,
                      stem = "tex_temp",
                      tex_message,
                      fileDir = tex_opts$get('fileDir'),
                      engine = tex_opts$get('engine'),
                      ...){
  
  cwd <- getwd()
  
  on.exit({setwd(cwd)},add = TRUE)
  
  setwd(fileDir)
  
  interaction_mode <- ifelse(tex_message, "nonstopmode", "batchmode")
  
  temp_tex    <- sprintf("%sDoc.tex",stem)
  temp_log    <- sprintf('%sDoc.log',stem)
  temp_out <- sprintf('%s_stdout.txt',stem)
  temp_err <- sprintf('%s_stderr.txt',stem)
  
  tex_args <- c('-synctex=1',
                sprintf('-interaction=%s',interaction_mode),
                '--halt-on-error',
                temp_tex)
  
  writeLines(tex_lines, con = temp_tex)

  system2(engine, args = tex_args, stdout = temp_out, stderr = temp_err,...)
  
  log_lines <- readLines(temp_log)
  
  attr(log_lines,'error') <- grepl('error',log_lines[length(log_lines)])

  log_lines
  
}
