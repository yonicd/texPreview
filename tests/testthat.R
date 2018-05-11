library(testthat)

if(!'xtable'%in%row.names(installed.packages()))
  install.packages('xtable')

library(texPreview)

test_check("texPreview")
