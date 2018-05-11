library(texPreview)

context('test for usepackage')

testthat::test_that('build usepackage call',{

  testthat::expect_equal(buildUsepackage(pkg = 'xcolor'),"\\usepackage{xcolor}")
  
  testthat::expect_equal(buildUsepackage(pkg = 'xcolor',chk.inst = TRUE),"\\usepackage{xcolor}")
  
  testthat::expect_equal(buildUsepackage(pkg = 'xcolor',options = 'usenames'),"\\usepackage[usenames]{xcolor}")
   
  testthat::expect_warning(buildUsepackage(pkg = 'nopack',chk.inst = TRUE))
  
})

testthat::test_that('build usepackage multiple calls',{
  

  geom.opts <- c('paperwidth=35cm','paperheight=35cm','left=2.5cm','top=2.5cm')
  
  use.opts <- "\\usetikzlibrary{mindmap,backgrounds}"
  
  l <- mapply(buildUsepackage,
    pkg =        list('times','geometry','tikz'),
    options=     list(NULL   ,geom.opts ,NULL),
    uselibrary = list(NULL   ,NULL      ,use.opts)
  )
  
  testthat::expect_is(l,'list')
  
  testthat::expect_equal(length(l),3)
  
})

context('find install tex packages')

testthat::test_that('find packages',{
  
  if(length(system('tlmgr --version',intern = TRUE))>0){
    
    x <- head(getTexPackages())
    
    testthat::expect_is(x,'character')
    testthat::expect_true(length(x)>0)    
    
  }else{
    
    testthat::expect_true(2+2==4)
    
  }
  
})

context('addin')

testthat::test_that('empty call',{
  testthat::expect_error(texAddin())
})