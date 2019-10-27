testthat::context('Rendering errors')

path <- file.path(tempdir(),'tex_err')

cleanup(path)

tex_opts$set(returnType = 'tex',fileDir = path)

tex <- '\\begin{tabular}{ll}
3&3&3
\\end{tabular}'

testthat::describe('force an error',{
  
  it('error message', {
    testthat::expect_error(texPreview::tex_preview(tex,marker = FALSE),'Extra alignment tab')
  })

})

cleanup(path,create = FALSE)
