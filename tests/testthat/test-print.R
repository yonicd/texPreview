testthat::context('utilities')

cleanup <- function(path, create = TRUE){
  
  unlink(path,recursive = TRUE,force = TRUE)
  
  tex_opts$restore()
  
  if(create)
    
    dir.create(path)
  
}

path <- file.path(tempdir(),'tex')

dir.create(path)

tex_opts$set(returnType = 'tex',fileDir = path)

tex <- '\\begin{tabular}{lll}
3&3&3
\\end{tabular}'

testthat::describe('print methods',{
  
  tex_output <- tex_preview(tex,returnType = 'tex')
  input_output <- tex_preview(tex,returnType = 'input')
  
  it('texpreview_tex', {
    testthat::expect_output(print(tex_output),regexp = 'tabular')
  })
  
  it('texpreview_input', {
    testthat::expect_output(print(input_output),regexp = 'tex_temp.tex')
  })
  
})

cleanup(path)