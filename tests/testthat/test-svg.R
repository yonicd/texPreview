testthat::context('svg outputs')

#R was compiled by
#    Debian clang version 17.0.5 (1)
#    Debian flang-new version 17.0.5 (1)
# <Magick::ErrorDelegate/C++Error/error/condition>
# Error: R: delegate failed `'potrace' --svg --output '%o' '%i'' @ error/delegate.c/InvokeDelegate/1997

testthat::skip_on_cran()

library(texPreview)

path <- file.path(tempdir(), 'tex')

cleanup(path)

tex_opts$set(returnType = 'viewer', fileDir = path, imgFormat='svg', svg_max=Inf)

testthat::describe('use svg device',{

  x <- texPreview::tex_preview(obj = xtable::xtable(head(iris,10)), stem="danp-test")
  it('check if file created', {
    testthat::expect_equal(length(list.files(path, pattern = 'svg$')),1)
  })
  
})

cleanup(path, create = FALSE)
