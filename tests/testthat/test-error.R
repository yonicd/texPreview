testthat::context('Rendering errors')

cleanup <- function(path, create = TRUE){
  
  unlink(path,recursive = TRUE,force = TRUE)
  
  tex_opts$restore()
  
  if(create)
    
    dir.create(path)
  
}

path <- file.path(tempdir(),'tex')

dir.create(path)

tex_opts$set(returnType = 'tex',fileDir = path)

tex <- '\\begin{tabular}{ll}
3&3&3
\\end{tabular}'

testthat::describe('force an error',{
  
  it('error message', {
    testthat::expect_error(texPreview::tex_preview(tex,marker = FALSE),'Extra alignment tab')
  })

})

cleanup(path)
