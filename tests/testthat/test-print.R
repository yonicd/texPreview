testthat::context('utilities')

skip_logic()

path <- file.path(tempdir(),'tex')

cleanup(path)

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

cleanup(path,create = FALSE)
