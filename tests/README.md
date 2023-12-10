Tests and Coverage
================
10 December, 2023 15:42:06

- <a href="#coverage" id="toc-coverage">Coverage</a>
- <a href="#unit-tests" id="toc-unit-tests">Unit Tests</a>

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                          | Coverage (%) |
|:------------------------------------------------|:------------:|
| texPreview                                      |    49.28     |
| [R/opts_complete.R](../R/opts_complete.R)       |     0.00     |
| [R/tex_engine.R](../R/tex_engine.R)             |     0.00     |
| [R/opts.R](../R/opts.R)                         |     5.88     |
| [R/tex_addin.R](../R/tex_addin.R)               |    12.50     |
| [R/tex_check.R](../R/tex_check.R)               |    25.81     |
| [R/zzz.R](../R/zzz.R)                           |    35.71     |
| [R/utils.R](../R/utils.R)                       |    40.00     |
| [R/get_texpackages.R](../R/get_texpackages.R)   |    50.00     |
| [R/tex_image.R](../R/tex_image.R)               |    69.23     |
| [R/tex_viewer.R](../R/tex_viewer.R)             |    77.27     |
| [R/tex_dir_setup.R](../R/tex_dir_setup.R)       |    78.95     |
| [R/tex_preview.R](../R/tex_preview.R)           |    83.33     |
| [R/print.R](../R/print.R)                       |    85.71     |
| [R/tex_return.R](../R/tex_return.R)             |    92.31     |
| [R/build_lines.R](../R/build_lines.R)           |    100.00    |
| [R/build_usepackage.R](../R/build_usepackage.R) |    100.00    |
| [R/kable.R](../R/kable.R)                       |    100.00    |
| [R/tex_build.R](../R/tex_build.R)               |    100.00    |
| [R/tex_cleanup.R](../R/tex_cleanup.R)           |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                          |   n |  time | error | failed | skipped | warning | icon |
|:----------------------------------------------|----:|------:|------:|-------:|--------:|--------:|:-----|
| [test-error.R](testthat/test-error.R)         |   1 | 2.878 |     0 |      0 |       0 |       0 |      |
| [test-kable.R](testthat/test-kable.R)         |  11 | 0.095 |     0 |      0 |       0 |       0 |      |
| [test-packages.R](testthat/test-packages.R)   |   1 | 0.008 |     0 |      0 |       0 |       0 |      |
| [test-print.R](testthat/test-print.R)         |   2 | 0.023 |     0 |      0 |       0 |       0 |      |
| [test-rmd.R](testthat/test-rmd.R)             |   7 | 0.101 |     0 |      0 |       0 |       0 |      |
| [test-tex.R](testthat/test-tex.R)             |  10 | 1.098 |     0 |      0 |       0 |       0 |      |
| [test-utilities.R](testthat/test-utilities.R) |   9 | 0.119 |     0 |      0 |       0 |       0 |      |
| [test-viewer.R](testthat/test-viewer.R)       |   6 | 2.063 |     0 |      0 |       0 |       4 | ⚠️   |

<details open>
<summary>
Show Detailed Test Results
</summary>

| file                                              | context                      | test                                              | status  |   n |  time | icon |
|:--------------------------------------------------|:-----------------------------|:--------------------------------------------------|:--------|----:|------:|:-----|
| [test-error.R](testthat/test-error.R#L17)         | Rendering errors             | force an error: error message                     | PASS    |   1 | 2.878 |      |
| [test-kable.R](testthat/test-kable.R#L37)         | converting to kable          | lines: value                                      | PASS    |   1 | 0.011 |      |
| [test-kable.R](testthat/test-kable.R#L42)         | converting to kable          | lines: class                                      | PASS    |   1 | 0.010 |      |
| [test-kable.R](testthat/test-kable.R#L46)         | converting to kable          | lines: attr                                       | PASS    |   1 | 0.007 |      |
| [test-kable.R](testthat/test-kable.R#L57)         | converting to kable          | file: value                                       | PASS    |   1 | 0.010 |      |
| [test-kable.R](testthat/test-kable.R#L62)         | converting to kable          | file: class                                       | PASS    |   1 | 0.010 |      |
| [test-kable.R](testthat/test-kable.R#L66)         | converting to kable          | file: attr                                        | PASS    |   1 | 0.006 |      |
| [test-kable.R](testthat/test-kable.R#L76)         | converting to kable          | self: class                                       | PASS    |   1 | 0.010 |      |
| [test-kable.R](testthat/test-kable.R#L80)         | converting to kable          | self: attr                                        | PASS    |   1 | 0.006 |      |
| [test-kable.R](testthat/test-kable.R#L95)         | converting to kable          | input: value                                      | PASS    |   1 | 0.010 |      |
| [test-kable.R](testthat/test-kable.R#L100)        | converting to kable          | input: class                                      | PASS    |   1 | 0.009 |      |
| [test-kable.R](testthat/test-kable.R#L104)        | converting to kable          | input: attr                                       | PASS    |   1 | 0.006 |      |
| [test-packages.R](testthat/test-packages.R#L8)    | packages                     | parse packages: lines                             | PASS    |   1 | 0.008 |      |
| [test-print.R](testthat/test-print.R#L21)         | utilities                    | print methods: texpreview_tex                     | PASS    |   1 | 0.009 |      |
| [test-print.R](testthat/test-print.R#L25)         | utilities                    | print methods: texpreview_input                   | PASS    |   1 | 0.014 |      |
| [test-rmd.R](testthat/test-rmd.R#L14)             | Rendering markdown           | html: output device                               | PASS    |   1 | 0.010 |      |
| [test-rmd.R](testthat/test-rmd.R#L18)             | Rendering markdown           | html: png output                                  | PASS    |   1 | 0.010 |      |
| [test-rmd.R](testthat/test-rmd.R#L29)             | Rendering markdown           | pdf: output device                                | PASS    |   1 | 0.042 |      |
| [test-rmd.R](testthat/test-rmd.R#L33)             | Rendering markdown           | pdf: returnType tex                               | PASS    |   1 | 0.010 |      |
| [test-rmd.R](testthat/test-rmd.R#L37)             | Rendering markdown           | pdf: png tex                                      | PASS    |   1 | 0.010 |      |
| [test-rmd.R](testthat/test-rmd.R#L41)             | Rendering markdown           | pdf: returnType input                             | PASS    |   1 | 0.010 |      |
| [test-rmd.R](testthat/test-rmd.R#L45)             | Rendering markdown           | pdf: png input                                    | PASS    |   1 | 0.009 |      |
| [test-tex.R](testthat/test-tex.R#L18)             | core tex function            | porting to tex: files generated                   | PASS    |   1 | 0.012 |      |
| [test-tex.R](testthat/test-tex.R#L22)             | core tex function            | porting to tex: class of output                   | PASS    |   1 | 0.005 |      |
| [test-tex.R](testthat/test-tex.R#L36)             | core tex function            | porting to tex no filedir: no files generated     | PASS    |   1 | 0.006 |      |
| [test-tex.R](testthat/test-tex.R#L40)             | core tex function            | porting to tex no filedir: class of output        | PASS    |   1 | 0.006 |      |
| [test-tex.R](testthat/test-tex.R#L54)             | core tex function            | keep pdf as an output: files generated            | PASS    |   1 | 0.006 |      |
| [test-tex.R](testthat/test-tex.R#L58)             | core tex function            | keep pdf as an output: class of output            | PASS    |   1 | 0.012 |      |
| [test-tex.R](testthat/test-tex.R#L73)             | core tex function            | html output: return magick object                 | PASS    |   1 | 1.030 |      |
| [test-tex.R](testthat/test-tex.R#L107)            | core tex function            | tex lines directly input: validate benchmark      | PASS    |   1 | 0.008 |      |
| [test-tex.R](testthat/test-tex.R#L120)            | core tex function            | use svg device: check if file created             | PASS    |   1 | 0.006 |      |
| [test-tex.R](testthat/test-tex.R#L137)            | core tex function            | space in file path: check if file created         | PASS    |   1 | 0.007 |      |
| [test-utilities.R](testthat/test-utilities.R#L8)  | utility functions of package | build usepackage call: basic call                 | PASS    |   1 | 0.008 |      |
| [test-utilities.R](testthat/test-utilities.R#L12) | utility functions of package | build usepackage call: check library is installed | PASS    |   1 | 0.026 |      |
| [test-utilities.R](testthat/test-utilities.R#L16) | utility functions of package | build usepackage call: add options                | PASS    |   1 | 0.008 |      |
| [test-utilities.R](testthat/test-utilities.R#L20) | utility functions of package | build usepackage call: use bad library name       | PASS    |   1 | 0.029 |      |
| [test-utilities.R](testthat/test-utilities.R#L38) | utility functions of package | build usepackage multiple calls: class            | PASS    |   1 | 0.007 |      |
| [test-utilities.R](testthat/test-utilities.R#L42) | utility functions of package | build usepackage multiple calls: dimension        | PASS    |   1 | 0.007 |      |
| [test-utilities.R](testthat/test-utilities.R#L56) | utility functions of package | find packages: check class                        | PASS    |   2 | 0.015 |      |
| [test-utilities.R](testthat/test-utilities.R#L73) | utility functions of package | empty call to addin: cause addin to crash         | PASS    |   1 | 0.019 |      |
| [test-viewer.R](testthat/test-viewer.R#L22_L28)   | Rendering viewer             | viewer output: validate viewer                    | WARNING |   3 | 1.173 | ⚠️   |
| [test-viewer.R](testthat/test-viewer.R#L38_L43)   | Rendering viewer             | shiny output: validate shiny output               | WARNING |   3 | 0.890 | ⚠️   |

| Failed | Warning | Skipped |
|:-------|:--------|:--------|
| 🛑     | ⚠️      | 🔶      |

</details>
<details>
<summary>
Session Info
</summary>

| Field    | Value                          |                                                                                                                                                                                                                                                                    |
|:---------|:-------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Version  | R version 4.3.2 (2023-10-31)   |                                                                                                                                                                                                                                                                    |
| Platform | x86_64-apple-darwin20 (64-bit) | <a href="https://github.com/yonicd/texPreview/commit/4b98f4c04c66beff0d044ca94182da0796e562e9/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
| Running  | macOS Monterey 12.7.1          |                                                                                                                                                                                                                                                                    |
| Language | en_US                          |                                                                                                                                                                                                                                                                    |
| Timezone | UTC                            |                                                                                                                                                                                                                                                                    |

| Package  | Version |
|:---------|:--------|
| testthat | 3.2.1   |
| covr     | 3.6.4   |
| covrpage | 0.2     |

</details>
<!--- Final Status : skipped/warning --->
