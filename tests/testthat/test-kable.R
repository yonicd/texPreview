testthat::context('converting to kable')

cleanup <- function(path, create = TRUE){
  
  unlink(path,recursive = TRUE,force = TRUE)
  
  tex_opts$restore()
  
  if(create)
    
    dir.create(path)
  
}

path <- file.path(tempdir(),'tex')

dir.create(path)

tex_opts$set(returnType = 'tex',fileDir = path)

tex <- '\\begin{tabular}{llr}
\\hline
\\multicolumn{2}{c}{Item} \\\\
\\cline{1-2}
Animal    & Description & Price (\\$) \\\\
\\hline
Gnat      & per gram    & 13.65      \\\\
& each        & 0.01       \\\\
Gnu       & stuffed     & 92.50      \\\\
Emu       & stuffed     & 33.33      \\\\
Armadillo & frozen      & 8.99       \\\\
\\hline
\\end{tabular}'

tf <- file.path(path,'kable_temp.tex')

file.create(tf)

cat(tex,file = tf,sep='\n')

testthat::describe('lines',{
  
  x <- as.kable(tex)
  
  it('value',{
    
    testthat::expect_true(grepl('begin',x))
    
  })
  
  it('class', {
    testthat::expect_true(inherits(x,'knitr_kable'))
  })
  
  it('attr', {
    testthat::expect_equal(attr(x,'format'),'latex')
  })  
  
})

testthat::describe('file',{
  
  x <- as.kable(tf)
  
  it('value',{
    
    testthat::expect_true(grepl('begin',x))
    
  })
  
  it('class', {
    testthat::expect_true(inherits(x,'knitr_kable'))
  })
  
  it('attr', {
    testthat::expect_equal(attr(x,'format'),'latex')
  })  
  
})

testthat::describe('self',{
  
  x <- as.kable(knitr::kable(mtcars,format = 'latex'))
  
  it('class', {
    testthat::expect_true(inherits(x,'knitr_kable'))
  })
  
  it('attr', {
    testthat::expect_equal(attr(x,'format'),'latex')
  })  
  
})


testthat::describe('input',{
  
  tex_input <- tex_preview(tex,returnType = 'input')
  
  x <- as.kable(tex_input)
  
  it('value',{
    
    testthat::expect_true(grepl('begin',x))
    
  })
  
  it('class', {
    testthat::expect_true(inherits(x,'knitr_kable'))
  })
  
  it('attr', {
    testthat::expect_equal(attr(x,'format'),'latex')
  })  
  
})


cleanup(path,create = FALSE)
