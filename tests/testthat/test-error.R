testthat::context('Rendering errors')

path <- file.path(tempdir(),'tex_err')

cleanup(path)

tex_opts$set(returnType = 'tex',fileDir = path)
options(tinytex.compile.max_times = 1)

tex <- '\\begin{tabular}{ll}
3&3&3
\\end{tabular}'

testthat::describe('force an error',{
  
  it('error message', {
    testthat::expect_error(texPreview::tex_preview(tex,marker = FALSE),'LaTeX failed to compile')
  })

})

options(tinytex.compile.max_times = NULL)
cleanup(path,create = FALSE)
