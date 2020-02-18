Tests and Coverage
================
18 February, 2020 02:01:28

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

    ## ⚠️ Not All Tests Passed
    ##   Coverage statistics are approximations of the non-failing tests.
    ##   Use with caution
    ## 
    ##  For further investigation check in testthat summary tables.

| Object                                                    | Coverage (%) |
| :-------------------------------------------------------- | :----------: |
| texPreview                                                |    51.07     |
| [R/opts\_complete.R](../R/opts_complete.R)                |     0.00     |
| [R/tex\_engine.R](../R/tex_engine.R)                      |     0.00     |
| [R/texPreview-deprecated.R](../R/texPreview-deprecated.R) |     0.00     |
| [R/opts.R](../R/opts.R)                                   |     5.88     |
| [R/tex\_addin.R](../R/tex_addin.R)                        |    12.50     |
| [R/zzz.R](../R/zzz.R)                                     |    35.71     |
| [R/tex\_check.R](../R/tex_check.R)                        |    47.06     |
| [R/get\_texpackages.R](../R/get_texpackages.R)            |    50.00     |
| [R/utils.R](../R/utils.R)                                 |    55.00     |
| [R/tex\_image.R](../R/tex_image.R)                        |    69.23     |
| [R/tex\_viewer.R](../R/tex_viewer.R)                      |    77.27     |
| [R/tex\_dir\_setup.R](../R/tex_dir_setup.R)               |    78.95     |
| [R/tex\_preview.R](../R/tex_preview.R)                    |    84.85     |
| [R/print.R](../R/print.R)                                 |    85.71     |
| [R/tex\_return.R](../R/tex_return.R)                      |    92.31     |
| [R/build\_lines.R](../R/build_lines.R)                    |    100.00    |
| [R/build\_usepackage.R](../R/build_usepackage.R)          |    100.00    |
| [R/kable.R](../R/kable.R)                                 |    100.00    |
| [R/tex\_build.R](../R/tex_build.R)                        |    100.00    |
| [R/tex\_cleanup.R](../R/tex_cleanup.R)                    |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                          |  n |  time | error | failed | skipped | warning |
| :-------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-error.R](testthat/test-error.R)         |  1 | 0.196 |     0 |      0 |       0 |       0 |
| [test-kable.R](testthat/test-kable.R)         | 11 | 0.008 |     0 |      0 |       0 |       0 |
| [test-packages.R](testthat/test-packages.R)   |  1 | 0.002 |     0 |      0 |       0 |       0 |
| [test-print.R](testthat/test-print.R)         |  2 | 0.005 |     0 |      0 |       0 |       0 |
| [test-rmd.R](testthat/test-rmd.R)             |  2 | 0.002 |     0 |      0 |       0 |       0 |
| [test-tex.R](testthat/test-tex.R)             | 10 | 0.239 |     0 |      0 |       0 |       0 |
| [test-utilities.R](testthat/test-utilities.R) |  9 | 0.054 |     0 |      0 |       0 |       0 |
| [test-viewer.R](testthat/test-viewer.R)       |  2 | 0.426 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results </summary>

| file                                              | context                      | test                                              | status | n |  time |
| :------------------------------------------------ | :--------------------------- | :------------------------------------------------ | :----- | -: | ----: |
| [test-error.R](testthat/test-error.R#L16)         | Rendering errors             | force an error: error message                     | PASS   | 1 | 0.196 |
| [test-kable.R](testthat/test-kable.R#L35)         | converting to kable          | lines: value                                      | PASS   | 1 | 0.001 |
| [test-kable.R](testthat/test-kable.R#L40)         | converting to kable          | lines: class                                      | PASS   | 1 | 0.001 |
| [test-kable.R](testthat/test-kable.R#L44)         | converting to kable          | lines: attr                                       | PASS   | 1 | 0.001 |
| [test-kable.R](testthat/test-kable.R#L55)         | converting to kable          | file: value                                       | PASS   | 1 | 0.000 |
| [test-kable.R](testthat/test-kable.R#L60)         | converting to kable          | file: class                                       | PASS   | 1 | 0.000 |
| [test-kable.R](testthat/test-kable.R#L64)         | converting to kable          | file: attr                                        | PASS   | 1 | 0.001 |
| [test-kable.R](testthat/test-kable.R#L74)         | converting to kable          | self: class                                       | PASS   | 1 | 0.000 |
| [test-kable.R](testthat/test-kable.R#L78)         | converting to kable          | self: attr                                        | PASS   | 1 | 0.001 |
| [test-kable.R](testthat/test-kable.R#L93)         | converting to kable          | input: value                                      | PASS   | 1 | 0.001 |
| [test-kable.R](testthat/test-kable.R#L98)         | converting to kable          | input: class                                      | PASS   | 1 | 0.001 |
| [test-kable.R](testthat/test-kable.R#L102)        | converting to kable          | input: attr                                       | PASS   | 1 | 0.001 |
| [test-packages.R](testthat/test-packages.R#L8)    | packages                     | parse packages: lines                             | PASS   | 1 | 0.002 |
| [test-print.R](testthat/test-print.R#L19)         | utilities                    | print methods: texpreview\_tex                    | PASS   | 1 | 0.003 |
| [test-print.R](testthat/test-print.R#L23)         | utilities                    | print methods: texpreview\_input                  | PASS   | 1 | 0.002 |
| [test-rmd.R](testthat/test-rmd.R#L12)             | Rendering markdown           | html: output device                               | PASS   | 1 | 0.001 |
| [test-rmd.R](testthat/test-rmd.R#L16)             | Rendering markdown           | html: png output                                  | PASS   | 1 | 0.001 |
| [test-rmd.R](testthat/test-rmd.R#L21_L44)         | Rendering markdown           | NA                                                | ERROR  | 0 |    NA |
| [test-tex.R](testthat/test-tex.R#L17)             | core tex function            | porting to tex: files generated                   | PASS   | 1 | 0.001 |
| [test-tex.R](testthat/test-tex.R#L21)             | core tex function            | porting to tex: class of output                   | PASS   | 1 | 0.000 |
| [test-tex.R](testthat/test-tex.R#L35)             | core tex function            | porting to tex no filedir: no files generated     | PASS   | 1 | 0.001 |
| [test-tex.R](testthat/test-tex.R#L39)             | core tex function            | porting to tex no filedir: class of output        | PASS   | 1 | 0.001 |
| [test-tex.R](testthat/test-tex.R#L53)             | core tex function            | keep pdf as an output: files generated            | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L57)             | core tex function            | keep pdf as an output: class of output            | PASS   | 1 | 0.000 |
| [test-tex.R](testthat/test-tex.R#L72)             | core tex function            | html output: return magick object                 | PASS   | 1 | 0.229 |
| [test-tex.R](testthat/test-tex.R#L106)            | core tex function            | tex lines directly input: validate benchmark      | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L120)            | core tex function            | use svg device: check if file created             | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L137)            | core tex function            | space in file path: check if file created         | PASS   | 1 | 0.001 |
| [test-utilities.R](testthat/test-utilities.R#L10) | utility functions of package | build usepackage call: basic call                 | PASS   | 1 | 0.001 |
| [test-utilities.R](testthat/test-utilities.R#L14) | utility functions of package | build usepackage call: check library is installed | PASS   | 1 | 0.020 |
| [test-utilities.R](testthat/test-utilities.R#L18) | utility functions of package | build usepackage call: add options                | PASS   | 1 | 0.001 |
| [test-utilities.R](testthat/test-utilities.R#L22) | utility functions of package | build usepackage call: use bad library name       | PASS   | 1 | 0.021 |
| [test-utilities.R](testthat/test-utilities.R#L40) | utility functions of package | build usepackage multiple calls: class            | PASS   | 1 | 0.000 |
| [test-utilities.R](testthat/test-utilities.R#L44) | utility functions of package | build usepackage multiple calls: dimension        | PASS   | 1 | 0.001 |
| [test-utilities.R](testthat/test-utilities.R#L58) | utility functions of package | find packages: check class                        | PASS   | 2 | 0.002 |
| [test-utilities.R](testthat/test-utilities.R#L75) | utility functions of package | empty call to addin: cause addin to crash         | PASS   | 1 | 0.008 |
| [test-viewer.R](testthat/test-viewer.R#L20_L26)   | Rendering viewer             | viewer output: validate viewer                    | PASS   | 1 | 0.230 |
| [test-viewer.R](testthat/test-viewer.R#L36_L41)   | Rendering viewer             | shiny output: validate shiny output               | PASS   | 1 | 0.196 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |                                                                                                                                                                                                                                                                                 |
| :------- | :---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Version  | R version 3.6.2 (2019-12-12)        |                                                                                                                                                                                                                                                                                 |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) | <a href="https://github.com/metrumresearchgroup/texPreview/commit/6f54871dad887b9d6dbeb5d75f018a638b50c150/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
| Running  | macOS Catalina 10.15.3              |                                                                                                                                                                                                                                                                                 |
| Language | en\_US                              |                                                                                                                                                                                                                                                                                 |
| Timezone | UTC                                 |                                                                                                                                                                                                                                                                                 |

| Package  | Version |
| :------- | :------ |
| testthat | 2.3.1   |
| covr     | 3.3.2   |
| covrpage | 0.0.71  |

</details>

<!--- Final Status : pass --->
