testthat::context('core tex function')

skip_logic()

library(texPreview)

path <- file.path(tempdir(),'tex')

cleanup(path)

tex_opts$set(returnType = 'tex',fileDir = path)
  
  testthat::describe('porting to tex',{

      x <- texPreview::tex_preview(obj = xtable::xtable(head(iris,10)))
    
      it('files generated', {
        testthat::expect_equal(length(list.files(path)),2)
      })
      
      it('class of output', {
        testthat::expect_is(x,'texpreview_tex')
      })  

  })
  
  cleanup(path)
  
  tex_opts$set(returnType = 'tex')
  
  testthat::describe('porting to tex no filedir',{

    x <- texPreview::tex_preview(obj = xtable::xtable(head(iris,10)))

    it('no files generated', {
      testthat::expect_equal(length(list.files(path)),0)
    })
    
    it('class of output', {
      testthat::expect_is(x,'texpreview_tex')
    })
  
  })
  
  cleanup(path)
  
  tex_opts$set(returnType = 'tex',fileDir = path)
  
  testthat::describe('keep pdf as an output',{

    x <- texPreview::tex_preview(obj = xtable::xtable(head(iris,10)),keep_pdf = TRUE)
  
    it('files generated', {
      testthat::expect_equal(length(list.files(path)),3)
    })
    
    it('class of output', {
      testthat::expect_is(x,'texpreview_tex')
    })
  
  })
  
  cleanup(path)
  
  tex_opts$set(returnType = 'html',fileDir = path)
  
  testthat::describe('html output',{

    it('return magick object', {
      
      x <- texPreview::tex_preview(obj = xtable::xtable(head(iris,10)))
      
      testthat::expect_true(inherits(x,"magick-image"))
      
    })
  
  })
  
  cleanup(path)
  
  tex_opts$set(returnType = 'tex',fileDir = path)

  testthat::describe('tex lines directly input',{

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
    
    x <- texPreview::tex_preview(obj = tex)

    it('validate benchmark', {
      
      bench <- readLines(file.path(path,"tex_temp.tex"))
      
      class(bench) <- 'texpreview_tex'
      
      testthat::expect_equal(x,bench)
    })
    
  })

    cleanup(path)
    
    path <- file.path(tempdir(),'my tex')

    cleanup(path)
    tex_opts$set(returnType = 'tex',fileDir = path,imgFormat = 'png')
    
    testthat::describe('space in file path',{
 
      x <- texPreview::tex_preview(obj = xtable::xtable(head(iris,10)))
      
      it('check if file created', {
        testthat::expect_equal(length(list.files(path,pattern = '\\.tex$')),1)
      })
      
    })  
    
    cleanup(path,create = FALSE)
