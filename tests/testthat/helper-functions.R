skip_logic <- function () {
  if (identical(.Platform$OS.type, "unix")) {
    if(any(grepl('fedora',system('cat /etc/os-release', intern = TRUE))))
      skip("fedora")
  }else{
    skip("Non Unix")
  }
  return(invisible(TRUE))
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
  