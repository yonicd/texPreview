testthat::context('Rendering viewer')

path <- file.path(tempdir(),'rmd')

cleanup(path)

default_viewer <- getOption('viewer')

options(viewer = function(x, filename){
  png(filename = file.path(tempdir(),'temp.png'))
  print(x)
  dev.off()
})

tex_opts$set(returnType = 'viewer',fileDir = path)

testthat::describe('viewer output',{
  
  it('validate viewer',{
    testthat::expect_output(
      mtcars |>
        utils::head(5) |>
        knitr::kable(format = 'latex',caption = 'my table',label = 'tbl1') |>
        tex_preview(returnType = 'viewer',stem = 'test_viewer'),
      regexp = 'index.html'
    )
  })

})

options(viewer = default_viewer)

testthat::describe('shiny output',{
  
  it('validate shiny output',{
    testthat::expect_null(
      mtcars |>
        utils::head(5) |>
        knitr::kable(format = 'latex',caption = 'my table',label = 'tbl1') |>
        tex_preview(returnType = 'shiny',stem = 'test_shiny')
    )
  })
  
})

cleanup(path,create = FALSE)
