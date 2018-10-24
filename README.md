[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/texPreview)](https://cran.r-project.org/package=texPreview)
[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active) 
![downloads](http://cranlogs.r-pkg.org/badges/texPreview)[![Travis-CI Build Status](https://travis-ci.org/metrumresearchgroup/texPreview.svg?branch=master)](https://travis-ci.org/metrumresearchgroup/texPreview)
[![Coverage Status](https://img.shields.io/codecov/c/github/metrumresearchgroup/texPreview/master.svg)](https://codecov.io/github/metrumresearchgroup/texPreview?branch=master)
[![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2018_10_22-brightgreen.svg)](http://tinyurl.com/ybkr8fsu)

# texPreview

Preview and save images of rendered snippets of LaTeX in RStudio viewer

  - Must have pdflatex in PATH (Windows users can install by running the following in R: `install.packages("installr"); installr::install.MikTeX()`)
  
  - Supports Tabular, equations and other LaTex functionalities.
  - Load TeX packages 
  - Input Preamble
  
  - Supports xtable inputs
  
  - Defined as Rstudio Addin so user can highlight text in the editor and invoke preview automatically.
  
  - Can be run in a rmarkdown enviornment pdf/html/book/beamer/ioslides/slidy/revealjs ...
  
  - Can be run in a shiny enviornment, as `shiny::renderImage` or as part of htmlwidgets like [bsplus::carousel](https://github.com/ijlyttle/bsplus),  [loryR::renderLoryR](https://github.com/timelyportfolio/loryR) and [slickR::renderSlickR](https://github.com/metrumresearchgroup/slickR).

![](https://github.com/metrumresearchgroup/texPreview/blob/master/Miscellaneous/Multimedia/texPreview.gif?raw=true)

When the output is set to 'svg' the default output to the viewer is [svgPanZoom](https://github.com/timelyportfolio/svgPanZoom), which allows for panning and zooming on the image in the viewer. If the package is not installed a static image will be loaded. 

![](https://github.com/metrumresearchgroup/texPreview/blob/master/Miscellaneous/Multimedia/texPreviewPanZoom.gif?raw=true)
