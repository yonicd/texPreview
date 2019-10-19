testthat::context('packages')

testthat::describe('parse packages',{
  
  tex <- readLines(system.file('tmpl.tex',package = 'texPreview'))
  
  it('lines', {
    testthat::expect_equal(length(texPreview:::tex_pkgs(lines = tex,file = NULL)),11)
  })

})
