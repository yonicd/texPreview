testthat::context('Rendering markdown')

path <- file.path(tempdir(),'rmd')

cleanup(path)

testthat::describe('html',{
  
  safe_render(input = '../assets/input/test_html.Rmd', output_dir = path, render_params = list(path = path), cran = TRUE, quiet = TRUE)
    
  it('output device', {
    testthat::expect_true(file.exists(file.path(path,'test_html.html')))
  })

  it('png output', {
    testthat::expect_true(file.exists(file.path(path,'test_html.png')))
  })
    
})

testthat::describe('pdf',{

  testthat::skip_on_cran()
  
  safe_render(input = '../assets/input/test_pdf.Rmd',output_dir = path, render_params = list(path = path), quiet = TRUE)
  
  it('output device', {
    testthat::expect_true(file.exists(file.path(path,'test_pdf.pdf')))
  })
  
  it('returnType tex', {
    testthat::expect_true(file.exists(file.path(path,'test_tex.tex')))
  })
  
  it('png tex', {
    testthat::expect_true(file.exists(file.path(path,'test_tex.png')))
  })
  
  it('returnType input', {
    testthat::expect_true(file.exists(file.path(path,'test_input.tex')))
  })
  
  it('png input', {
    testthat::expect_true(file.exists(file.path(path,'test_input.png')))
  })
})

cleanup(path,create = FALSE)
