library(texPreview)

context('core tex function')

if(interactive()){

  context('core tex function running')
  
  cleanup <- function(path, create = TRUE){
    
    unlink(path)
    
    tex_opts$restore()
    
    if(create)
      
      dir.create(path)
    
  }
  
  path <- file.path(tempdir(),'tex')
  
  dir.create(path)
  
  tex_opts$set(returnType = 'tex',fileDir = path)
  
  testthat::test_that('porting to tex',{
    
    x <- texPreview(obj = xtable::xtable(head(iris,10)))
    
    expect_equal(length(list.files(path)),2)
    expect_is(x,'character')
    
  })
  
  cleanup(path)
  
  tex_opts$set(returnType = 'tex')
  
  testthat::test_that('porting to tex no filedir',{
  
    x <- texPreview(obj = xtable::xtable(head(iris,10)))
  
    expect_equal(length(list.files(path)),2)
    expect_is(x,'character')
  
  })
  
  cleanup(path)
  
  tex_opts$set(returnType = 'tex',fileDir = path)
  
  testthat::test_that('keep_pdf',{
  
    x <- texPreview(obj = xtable::xtable(head(iris,10)),keep_pdf = TRUE)
  
    expect_equal(length(list.files(path)),3)
    expect_is(x,'character')
  
  })
  
  cleanup(path)
  
  tex_opts$set(returnType = 'html',fileDir = path)
  
  testthat::test_that('html',{
  
    expect_output(texPreview(obj = xtable::xtable(head(iris,10)),keep_pdf = TRUE))
  
  })
  
  cleanup(path)
  
  tex_opts$set(returnType = 'viewer',fileDir = path,imgFormat='svg')
  
  testthat::test_that('svg',{
  
    x <- texPreview(obj = xtable::xtable(head(iris,10)))
  
    expect_equal(length(list.files(path,pattern = 'svg$')),1)
  
  })
  
  cleanup(path)
  
  tex_opts$set(returnType = 'tex',fileDir = path)
  
  testthat::test_that('tex lines',{
    
    tex='\\begin{tabular}{llr}
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
    
    x <- texPreview(obj = tex)
    
    expect_equal(x,paste0(readLines(file.path(path,'tex_temp.tex')),collapse='\n'))
    
  })
  
  
  cleanup(path,create = FALSE)

}else{
 
  context('core tex function not running')
   
  testthat::expect_true(2+2==4)
  
}