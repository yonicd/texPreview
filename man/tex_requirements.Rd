% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tex_check.R
\name{tex_requirements}
\alias{tex_requirements}
\title{Query TeX file for Required Packages}
\usage{
tex_requirements(
  file = system.file("tmpl.tex", package = "texPreview"),
  lines = NULL
)
}
\arguments{
\item{file}{character, Path to TeX file, Default: system.file("tmpl.tex", package = "texPreview")}

\item{lines}{character, character vector containing TeX script, Default: NULL}
}
\value{
character
}
\description{
Parse TeX file for usepackage calls and return a vector of the packages.
}
\details{
If file is NULL then function will use the the value in lines.
The default path used in file is the internal template that the package uses.
}
\examples{
tex_requirements()
}
\concept{reqs}
