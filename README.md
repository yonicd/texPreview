[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/texPreview)](https://cran.r-project.org/package=texPreview)
[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active) 
[![](https://cranlogs.r-pkg.org/badges/texPreview)](https://cran.r-project.org/package=texPreview)
[![Coverage Status](https://img.shields.io/codecov/c/github/metrumresearchgroup/texPreview/master.svg)](https://codecov.io/github/metrumresearchgroup/texPreview?branch=master)
[![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2020_02_14-brightgreen.svg)](http://tinyurl.com/ybkr8fsu)
[![Travis-CI Build Status](https://travis-ci.org/metrumresearchgroup/texPreview.svg?branch=master)](https://travis-ci.org/metrumresearchgroup/texPreview)
[![R-win build
status](https://github.com/metrumresearchgroup/texPreview/workflows/R-win/badge.svg)](https://github.com/metrumresearchgroup/texPreview)
[![R-mac build
status](https://github.com/metrumresearchgroup/texPreview/workflows/R-mac/badge.svg)](https://github.com/metrumresearchgroup/texPreview)

# texPreview

Efficiently iterate, refine and share snippets of LaTeX in R with ease.

`texPreview` compiles LaTeX directly into images from the R console to view in the RStudio viewer pane, Shiny apps and RMarkdown documents.

## Functionality

  - __Supports__: character, knitr, kableExtra, xtable, texreg, equatiomatic classes
  
  - __Extendable__: `S3` methods can be written for the main call, `texPreview::tex_preview`, to use with new classes for rendering and printing.
  
  - __Rstudio Addin__: Users can highlight text in the editor and invoke preview automatically.
  
  - __RMarkdown__ document compatible with all document outputs
  
  - __Shiny__ compatible via `shiny::renderImage` or as part of htmlwidgets like `slickR::slickR`.

  - __Pan and Zoom functionality__: When the output is set to 'svg' the default output to the viewer is `svgPanZoom::svgPanZoom`, which allows for panning and zooming on the image in the viewer. If the package is not installed a static image will be loaded. 

  - __System Requirements__: 
    - Must have pdflatex in PATH, Windows users can install by running [installr::install.MikTeX](http://talgalili.github.io/installr/reference/install.MikTeX.html)
    - TeX libraries that are used: `standalone`, `xcolor`, `booktabs`, `multirow`, `array`, `helvet`, `amsmath`, `rotating`, `listings`, `graphicx`, `setspace`, `caption`
      - To Check if the system is in compliance with these libraries run `texPreview::check_requirements()`.
    - Ghostscript: If you are installing TeX with [tinytex](https://github.com/yihui/tinytex) make sure to install ghostscript onto your system.
    
## Examples

### Basic

![](https://github.com/metrumresearchgroup/texPreview/blob/misc/Multimedia/texPreview.gif?raw=true)

### Pan/Zoom

![](https://github.com/metrumresearchgroup/texPreview/blob/misc/Multimedia/texPreviewPanZoom.gif?raw=true)
