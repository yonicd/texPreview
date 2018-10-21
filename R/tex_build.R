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
  
  interaction_mode <- ifelse(tex_message, "nonstopmode", "batchmode")
  
  temp_file <- file.path(getwd(),sprintf("%sDoc.tex",stem))
  
  writeLines(tex_lines, con = temp_file)
  
  tinytex::latexmk(
    file = temp_file,
    engine = engine,
    engine_args = sprintf('-synctex=1 -interaction=%s --halt-on-error',interaction_mode),
    clean = FALSE
    )
  
  #system(sprintf("%s -synctex=1 -interaction=%s --halt-on-error %s",engine,interaction_mode,temp_file),...)
  
}