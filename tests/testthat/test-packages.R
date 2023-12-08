testthat::context('packages')

testthat::describe('parse packages',{
  
  tex <- readLines(system.file('tmpl.tex',package = 'texPreview'))
  
  it('lines', {
    testthat::expect_equal(length(tex_requirements(lines = tex,file = NULL)),12)
  })

})
