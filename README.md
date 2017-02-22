# texPreview

Preview and save images of rendered snippets of LaTeX in RStudio viewer

  - Must have pdflatex in PATH (Windows users can install by running the following in R: `install.packages("installr"); installr::install.MikTeX()`)
  
  - Supports Tabular, equations and other LaTex functionalities.
  - Load TeX packages 
  - Input Preamble
  
  - Supports xtable inputs
  
  - Defined as Rstudio Addin so user can highlight text in the editor and invoke preview automatically.
  
  - Can be run in a rmarkdown enviornment pdf/html/book/beamer/ioslides/slidy/revealjs ...
  
  - Can be run in a shiny enviornment, as `shiny::renderImage` or as part of htmlwidgets like [bsplus::carousel](https://github.com/ijlyttle/bsplus) and [loryR::renderLoryR](https://github.com/timelyportfolio/loryR)

![](https://github.com/metrumresearchgroup/texPreview/blob/master/texPreview.gif?raw=true)

When the output is set to 'svg' the default output to the viewer is [svgPanZoom](https://github.com/timelyportfolio/svgPanZoom), which allows for panning and zooming on the image in the viewer. If the package is not installed a static image will be loaded. 
