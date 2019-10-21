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
  
  temp_tex    <- file.path(fileDir,sprintf("%sDoc.tex",stem))
  temp_stdout <- file.path(fileDir,sprintf('%s_stdout.txt',stem))
  temp_stderr <- file.path(fileDir,sprintf('%s_stderr.txt',stem))
  
  tex_args <- c('-synctex=1',
                sprintf('-interaction=%s',interaction_mode),
                '--halt-on-error',
                temp_tex)
  
  writeLines(tex_lines, con = temp_tex)

  system2(engine, args = tex_args, stdout = temp_stdout, stderr = temp_stderr,...)
  
  log_lines <- readLines(tex_path(fileDir,stem = paste0(stem,'Doc'),dev = 'log'))
  
  attr(log_lines,'error') <- grepl('error',log_lines[length(log_lines)])

  log_lines
  
}