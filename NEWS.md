# texPreview 1.5.1
* Replace knitr::wrap with knitr::sew

# texPreview 1.4.4
* Add knitr engine for package
* Move details from Suggests to Imports

# texPreview 1.4.3
* Add conditional expectation for testing with pandocs on CRAN

# texPreview 1.4.2
* Add details and pdflatex to Suggests in DESCRIPTION file

# texPreview 1.4.1
* Fix non-tempdir() rendering
* Add texpreview_input print method for knitr_kable

# texPreview 1.4.0
* Convert tex_preview into S3 method
* Add print method for classes
* Add as.kable to convert tex lines into knitr_kable
* Update documentation for tex_preview
* Update and add vignettes

# texPreview 1.3.2
* Fix rotation LaTeX library used for rotation in the internal template.

# texPreview 1.3.1
* Fix path normalization to OS agnostic.

# texPreview 1.3.0

* Change names of function from camelcase to underscore and soft depreciate the camelcase
  - Old: texPreview, buildUsepackage, getTexPackages, texAddin
  - New: tex_preview, build_usepackage, get_texpackages, tex_addin

# texPreview 1.1.5

* fix viewer issue to keep new pages in internal viewer


# texPreview 1.1.4

* Added a `NEWS.md` file to track changes to the package.
* Added pagination of preview outputs in the `Rstudio` internal viewer.
