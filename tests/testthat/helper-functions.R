skip_on_windows <- function () {
  if (identical(.Platform$OS.type, "unix")) {
    return(invisible(TRUE))
  }
  skip("Non Unix")
}

cleanup <- function(path, create = TRUE){
  
  unlink(path,recursive = TRUE,force = TRUE)
  
  tex_opts$restore()
  
  if(create)
    
    dir.create(path)
  
}

safe_render <- function(input, output_dir, render_params, pandoc_version = "1.12.3", cran = FALSE,...){
  
  testthat::skip_if_not(rmarkdown::pandoc_available(pandoc_version))
  
  if(!cran)
    testthat::skip_on_cran()
  
  rmarkdown::render(input = input, output_dir = output_dir, params = render_params, ...)
  
}
  