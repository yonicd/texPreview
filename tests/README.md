Tests and Coverage
================
23 January, 2024 12:49:38

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                           | Coverage (%) |
| :----------------------------------------------- | :----------: |
| texPreview                                       |    44.95     |
| [R/opts\_complete.R](../R/opts_complete.R)       |     0.00     |
| [R/tex\_engine.R](../R/tex_engine.R)             |     0.00     |
| [R/opts.R](../R/opts.R)                          |     5.88     |
| [R/tex\_addin.R](../R/tex_addin.R)               |    12.50     |
| [R/tex\_check.R](../R/tex_check.R)               |    25.81     |
| [R/tex\_viewer.R](../R/tex_viewer.R)             |    27.27     |
| [R/zzz.R](../R/zzz.R)                            |    35.71     |
| [R/utils.R](../R/utils.R)                        |    40.00     |
| [R/print.R](../R/print.R)                        |    42.86     |
| [R/get\_texpackages.R](../R/get_texpackages.R)   |    50.00     |
| [R/tex\_image.R](../R/tex_image.R)               |    69.23     |
| [R/tex\_dir\_setup.R](../R/tex_dir_setup.R)      |    78.95     |
| [R/tex\_preview.R](../R/tex_preview.R)           |    83.33     |
| [R/tex\_return.R](../R/tex_return.R)             |    84.62     |
| [R/build\_lines.R](../R/build_lines.R)           |    100.00    |
| [R/build\_usepackage.R](../R/build_usepackage.R) |    100.00    |
| [R/kable.R](../R/kable.R)                        |    100.00    |
| [R/tex\_build.R](../R/tex_build.R)               |    100.00    |
| [R/tex\_cleanup.R](../R/tex_cleanup.R)           |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                          |  n |  time | error | failed | skipped | warning | icon |
| :-------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: | :--- |
| [test-error.R](testthat/test-error.R)         |  1 | 3.307 |     0 |      0 |       0 |       0 |      |
| [test-kable.R](testthat/test-kable.R)         | 11 | 0.053 |     0 |      0 |       0 |       0 |      |
| [test-packages.R](testthat/test-packages.R)   |  1 | 0.003 |     0 |      0 |       0 |       0 |      |
| [test-print.R](testthat/test-print.R)         |  2 | 0.009 |     0 |      0 |       0 |       0 |      |
| [test-rmd.R](testthat/test-rmd.R)             |  7 | 0.040 |     0 |      0 |       0 |       0 |      |
| [test-svg.R](testthat/test-svg.R)             |  1 | 0.005 |     0 |      0 |       0 |       0 |      |
| [test-tex.R](testthat/test-tex.R)             |  9 | 0.442 |     0 |      0 |       0 |       0 |      |
| [test-utilities.R](testthat/test-utilities.R) |  9 | 0.150 |     0 |      0 |       0 |       0 |      |
| [test-viewer.R](testthat/test-viewer.R)       |  6 | 0.858 |     0 |      0 |       0 |       4 | ⚠️   |

<details open>

<summary> Show Detailed Test Results </summary>

| file                                              | context                      | test                                              | status  | n |  time | icon |
| :------------------------------------------------ | :--------------------------- | :------------------------------------------------ | :------ | -: | ----: | :--- |
| [test-error.R](testthat/test-error.R#L17)         | Rendering errors             | force an error: error message                     | PASS    | 1 | 3.307 |      |
| [test-kable.R](testthat/test-kable.R#L37)         | converting to kable          | lines: value                                      | PASS    | 1 | 0.011 |      |
| [test-kable.R](testthat/test-kable.R#L42)         | converting to kable          | lines: class                                      | PASS    | 1 | 0.004 |      |
| [test-kable.R](testthat/test-kable.R#L46)         | converting to kable          | lines: attr                                       | PASS    | 1 | 0.003 |      |
| [test-kable.R](testthat/test-kable.R#L57)         | converting to kable          | file: value                                       | PASS    | 1 | 0.005 |      |
| [test-kable.R](testthat/test-kable.R#L62)         | converting to kable          | file: class                                       | PASS    | 1 | 0.005 |      |
| [test-kable.R](testthat/test-kable.R#L66)         | converting to kable          | file: attr                                        | PASS    | 1 | 0.003 |      |
| [test-kable.R](testthat/test-kable.R#L76)         | converting to kable          | self: class                                       | PASS    | 1 | 0.005 |      |
| [test-kable.R](testthat/test-kable.R#L80)         | converting to kable          | self: attr                                        | PASS    | 1 | 0.003 |      |
| [test-kable.R](testthat/test-kable.R#L95)         | converting to kable          | input: value                                      | PASS    | 1 | 0.006 |      |
| [test-kable.R](testthat/test-kable.R#L100)        | converting to kable          | input: class                                      | PASS    | 1 | 0.005 |      |
| [test-kable.R](testthat/test-kable.R#L104)        | converting to kable          | input: attr                                       | PASS    | 1 | 0.003 |      |
| [test-packages.R](testthat/test-packages.R#L8)    | packages                     | parse packages: lines                             | PASS    | 1 | 0.003 |      |
| [test-print.R](testthat/test-print.R#L21)         | utilities                    | print methods: texpreview\_tex                    | PASS    | 1 | 0.005 |      |
| [test-print.R](testthat/test-print.R#L25)         | utilities                    | print methods: texpreview\_input                  | PASS    | 1 | 0.004 |      |
| [test-rmd.R](testthat/test-rmd.R#L14)             | Rendering markdown           | html: output device                               | PASS    | 1 | 0.005 |      |
| [test-rmd.R](testthat/test-rmd.R#L18)             | Rendering markdown           | html: png output                                  | PASS    | 1 | 0.005 |      |
| [test-rmd.R](testthat/test-rmd.R#L29)             | Rendering markdown           | pdf: output device                                | PASS    | 1 | 0.005 |      |
| [test-rmd.R](testthat/test-rmd.R#L33)             | Rendering markdown           | pdf: returnType tex                               | PASS    | 1 | 0.006 |      |
| [test-rmd.R](testthat/test-rmd.R#L37)             | Rendering markdown           | pdf: png tex                                      | PASS    | 1 | 0.005 |      |
| [test-rmd.R](testthat/test-rmd.R#L41)             | Rendering markdown           | pdf: returnType input                             | PASS    | 1 | 0.010 |      |
| [test-rmd.R](testthat/test-rmd.R#L45)             | Rendering markdown           | pdf: png input                                    | PASS    | 1 | 0.004 |      |
| [test-svg.R](testthat/test-svg.R#L23)             | svg outputs                  | use svg device: check if file created             | PASS    | 1 | 0.005 |      |
| [test-tex.R](testthat/test-tex.R#L18)             | core tex function            | porting to tex: files generated                   | PASS    | 1 | 0.004 |      |
| [test-tex.R](testthat/test-tex.R#L22)             | core tex function            | porting to tex: class of output                   | PASS    | 1 | 0.003 |      |
| [test-tex.R](testthat/test-tex.R#L36)             | core tex function            | porting to tex no filedir: no files generated     | PASS    | 1 | 0.009 |      |
| [test-tex.R](testthat/test-tex.R#L40)             | core tex function            | porting to tex no filedir: class of output        | PASS    | 1 | 0.005 |      |
| [test-tex.R](testthat/test-tex.R#L54)             | core tex function            | keep pdf as an output: files generated            | PASS    | 1 | 0.004 |      |
| [test-tex.R](testthat/test-tex.R#L58)             | core tex function            | keep pdf as an output: class of output            | PASS    | 1 | 0.003 |      |
| [test-tex.R](testthat/test-tex.R#L73)             | core tex function            | html output: return magick object                 | PASS    | 1 | 0.408 |      |
| [test-tex.R](testthat/test-tex.R#L107)            | core tex function            | tex lines directly input: validate benchmark      | PASS    | 1 | 0.003 |      |
| [test-tex.R](testthat/test-tex.R#L124)            | core tex function            | space in file path: check if file created         | PASS    | 1 | 0.003 |      |
| [test-utilities.R](testthat/test-utilities.R#L8)  | utility functions of package | build usepackage call: basic call                 | PASS    | 1 | 0.003 |      |
| [test-utilities.R](testthat/test-utilities.R#L12) | utility functions of package | build usepackage call: check library is installed | PASS    | 1 | 0.008 |      |
| [test-utilities.R](testthat/test-utilities.R#L16) | utility functions of package | build usepackage call: add options                | PASS    | 1 | 0.003 |      |
| [test-utilities.R](testthat/test-utilities.R#L20) | utility functions of package | build usepackage call: use bad library name       | PASS    | 1 | 0.009 |      |
| [test-utilities.R](testthat/test-utilities.R#L38) | utility functions of package | build usepackage multiple calls: class            | PASS    | 1 | 0.003 |      |
| [test-utilities.R](testthat/test-utilities.R#L42) | utility functions of package | build usepackage multiple calls: dimension        | PASS    | 1 | 0.003 |      |
| [test-utilities.R](testthat/test-utilities.R#L56) | utility functions of package | find packages: check class                        | PASS    | 2 | 0.006 |      |
| [test-utilities.R](testthat/test-utilities.R#L73) | utility functions of package | empty call to addin: cause addin to crash         | PASS    | 1 | 0.115 |      |
| [test-viewer.R](testthat/test-viewer.R#L22_L28)   | Rendering viewer             | viewer output: validate viewer                    | WARNING | 3 | 0.436 | ⚠️   |
| [test-viewer.R](testthat/test-viewer.R#L38_L43)   | Rendering viewer             | shiny output: validate shiny output               | WARNING | 3 | 0.422 | ⚠️   |

| Failed | Warning | Skipped |
| :----- | :------ | :------ |
| 🛑      | ⚠️      | 🔶       |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                         |
| :------- | :---------------------------- |
| Version  | R version 4.3.2 (2023-10-31)  |
| Platform | x86\_64-pc-linux-gnu (64-bit) |
| Running  | Ubuntu 20.04.6 LTS            |
| Language | C                             |
| Timezone | America/New\_York             |

| Package  | Version |
| :------- | :------ |
| testthat | 3.2.1   |
| covr     | 3.6.4   |
| covrpage | 0.2     |

</details>

<!--- Final Status : skipped/warning --->
