#' @title Query TeX file for Required Packages
#' @description Parse TeX file for usepackage calls and return a vector of the packages.
#' @param file character, Path to TeX file, Default: system.file("tmpl.tex", package = "texPreview")
#' @param lines character, character vector containing TeX script, Default: NULL
#' @return character
#' @details If file is NULL then function will use the the value in lines. 
#' The default path used in file is the internal template that the package uses.
#' @examples 
#' tex_requirements()
#' @rdname tex_requirements
#' @concept reqs
#' @export 

tex_requirements <- function(file = system.file('tmpl.tex',package = 'texPreview'), lines = NULL){
  
  if(!is.null(file))
    lines <- readLines(file)
  
  tex_req_type('usepackage', lines)
   
}

tex_req_type <- function(arg_type, tex_lines){
  x <- grep(sprintf('\\\\%s',arg_type), tex_lines, value = TRUE)
  
  x <- gsub('\\[(.*?)\\]','',x)
  
  gsub('[{}]','',unlist(regmatches(x, gregexpr('\\{(.*?)\\}', x))))
}

#' @title Check TeX Requirements for Package
#' @description Checks if the required TeX libraries are installed on the system to render the 
#' internal tex file template.
#' @return logical
#' @examples 
#' #check_requirements()
#' @rdname check_requirements
#' @concept reqs
#' @export 

check_requirements <- function(){
  
  
  chk <- sapply(tex_requirements(),check_package)
  
  if(!all(chk)){
    warning(sprintf('missing tex packages needed for texPreview: %s', paste0(names(chk)[!chk],collapse = ', ')))
  }  
  
  chk
}


check_package <- function(x){
  
  if(nzchar(Sys.which("tlmgr"))){
    
    check_texlive(x)  
    
  }else{
    
    if(nzchar(Sys.which("mpm"))){
      check_mpm(x)
    }else{
      stop('neither tlmgr or mpm are installed and in %PATH%')
    }
      
    
  }
  
}

check_texlive <- function(x) length(suppressWarnings(system(sprintf('kpsewhich %s.sty',x),intern = TRUE)))>0

check_mpm <- function(x) length(shell(sprintf("mpm --list-package-names | grep %s",x),intern=TRUE))>0

texpreview_base_req <- c('standalone', 'xcolor', 'booktabs', 'multirow', 'amsmath',
'listings', 'setspace', 'caption', 'graphics', 'tools', 'psnfss', 'varwidth',
'colortbl', 'epstopdf-pkg', 'pgf','makeindex')

#' @importFrom tinytex check_installed tlmgr_install
check_base_req <- function(){
  chk <- texpreview_base_req[!tinytex::check_installed(texpreview_base_req)]
  if(length(chk)>0){
    update_pkgs <- TRUE

    if(interactive()){
      update_pkgs <- switch(
        menu(
          title = 'Install missing tex packages?',
          choices = c("Yes", "No")) + 1,
            cat("Nothing done\n"), 
            TRUE, 
            FALSE)
    }

  if(update_pkgs){
    tinytex::tlmgr_install(chk)
  }
    
  }
}
