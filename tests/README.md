Tests and Coverage
================
21 October, 2018 16:45:00

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                           | Coverage (%) |
| :----------------------------------------------- | :----------: |
| texPreview                                       |    58.00     |
| [R/opts.R](../R/opts.R)                          |     5.88     |
| [R/tex\_addin.R](../R/tex_addin.R)               |    12.50     |
| [R/opts\_complete.R](../R/opts_complete.R)       |    14.63     |
| [R/tex\_viewer.R](../R/tex_viewer.R)             |    40.91     |
| [R/get\_texpackages.R](../R/get_texpackages.R)   |    50.00     |
| [R/zzz.R](../R/zzz.R)                            |    60.00     |
| [R/tex\_dir\_setup.R](../R/tex_dir_setup.R)      |    78.95     |
| [R/tex\_return.R](../R/tex_return.R)             |    80.00     |
| [R/build\_usepackage.R](../R/build_usepackage.R) |    84.62     |
| [R/tex\_image.R](../R/tex_image.R)               |    93.33     |
| [R/build\_lines.R](../R/build_lines.R)           |    100.00    |
| [R/tex\_build.R](../R/tex_build.R)               |    100.00    |
| [R/tex\_cleanup.R](../R/tex_cleanup.R)           |    100.00    |
| [R/texPreview.R](../R/texPreview.R)              |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                          | n |  time | error | failed | skipped | warning |
| :-------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-tex.R](testthat/test-tex.R)             | 9 | 0.644 |     0 |      0 |       0 |       0 |
| [test-utilities.R](testthat/test-utilities.R) | 9 | 0.288 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                              | context                      | test                                              | status | n |  time |
| :------------------------------------------------ | :--------------------------- | :------------------------------------------------ | :----- | -: | ----: |
| [test-tex.R](testthat/test-tex.R#L33)             | core tex function            | porting to tex: files generated                   | PASS   | 1 | 0.003 |
| [test-tex.R](testthat/test-tex.R#L37)             | core tex function            | porting to tex: class of output                   | PASS   | 1 | 0.001 |
| [test-tex.R](testthat/test-tex.R#L51)             | core tex function            | porting to tex no filedir: no files generated     | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L55)             | core tex function            | porting to tex no filedir: class of output        | PASS   | 1 | 0.001 |
| [test-tex.R](testthat/test-tex.R#L69)             | core tex function            | keep pdf as an output: files generated            | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L73)             | core tex function            | keep pdf as an output: class of output            | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L88)             | core tex function            | html output: return magick object                 | PASS   | 1 | 0.628 |
| [test-tex.R](testthat/test-tex.R#L117)            | core tex function            | tex lines directly input: validate benchmark      | PASS   | 1 | 0.003 |
| [test-tex.R](testthat/test-tex.R#L135)            | core tex function            | use svg device: check if file created             | PASS   | 1 | 0.002 |
| [test-utilities.R](testthat/test-utilities.R#L8)  | utility functions of package | build usepackage call: basic call                 | PASS   | 1 | 0.002 |
| [test-utilities.R](testthat/test-utilities.R#L12) | utility functions of package | build usepackage call: check library is installed | PASS   | 1 | 0.134 |
| [test-utilities.R](testthat/test-utilities.R#L16) | utility functions of package | build usepackage call: add options                | PASS   | 1 | 0.001 |
| [test-utilities.R](testthat/test-utilities.R#L20) | utility functions of package | build usepackage call: use bad library name       | PASS   | 1 | 0.136 |
| [test-utilities.R](testthat/test-utilities.R#L39) | utility functions of package | build usepackage multiple calls: class            | PASS   | 1 | 0.001 |
| [test-utilities.R](testthat/test-utilities.R#L43) | utility functions of package | build usepackage multiple calls: dimension        | PASS   | 1 | 0.002 |
| [test-utilities.R](testthat/test-utilities.R#L57) | utility functions of package | find packages: check class                        | PASS   | 2 | 0.002 |
| [test-utilities.R](testthat/test-utilities.R#L73) | utility functions of package | empty call to addin: cause addin to crash         | PASS   | 1 | 0.010 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.5.1 (2018-07-02)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS High Sierra 10.13.6           |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version    |
| :------- | :--------- |
| testthat | 2.0.0.9000 |
| covr     | 3.2.0      |
| covrpage | 0.0.61     |

</details>

<!--- Final Status : pass --->
