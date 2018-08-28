Tests and Coverage
================
28 August, 2018 13:06:51

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                        | Coverage (%) |
| :-------------------------------------------- | :----------: |
| texPreview                                    |    64.02     |
| [R/buildUsepackage.R](../R/buildUsepackage.R) |     0.00     |
| [R/getTexPackages.R](../R/getTexPackages.R)   |     0.00     |
| [R/texAddin.R](../R/texAddin.R)               |     0.00     |
| [R/defaults.R](../R/defaults.R)               |     6.06     |
| [R/tex\_dir\_setup.R](../R/tex_dir_setup.R)   |    78.95     |
| [R/tex\_return.R](../R/tex_return.R)          |    83.33     |
| [R/tex\_viewer.R](../R/tex_viewer.R)          |    93.75     |
| [R/build\_lines.R](../R/build_lines.R)        |    100.00    |
| [R/tex\_build.R](../R/tex_build.R)            |    100.00    |
| [R/tex\_cleanup.R](../R/tex_cleanup.R)        |    100.00    |
| [R/tex\_image.R](../R/tex_image.R)            |    100.00    |
| [R/texPreview.R](../R/texPreview.R)           |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

|            | file                              | n |  time | error | failed | skipped | warning |
| ---------- | :-------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| test-tex.R | [test-tex.R](testthat/test-tex.R) | 9 | 0.643 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                   | context           | test                                          | status | n |  time |
| :------------------------------------- | :---------------- | :-------------------------------------------- | :----- | -: | ----: |
| [test-tex.R](testthat/test-tex.R#L31)  | core tex function | porting to tex: files generated               | PASS   | 1 | 0.017 |
| [test-tex.R](testthat/test-tex.R#L35)  | core tex function | porting to tex: class of output               | PASS   | 1 | 0.001 |
| [test-tex.R](testthat/test-tex.R#L49)  | core tex function | porting to tex no filedir: no files generated | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L53)  | core tex function | porting to tex no filedir: class of output    | PASS   | 1 | 0.001 |
| [test-tex.R](testthat/test-tex.R#L67)  | core tex function | keep pdf as an output: files generated        | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L71)  | core tex function | keep pdf as an output: class of output        | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L84)  | core tex function | html output: print to console the html script | PASS   | 1 | 0.614 |
| [test-tex.R](testthat/test-tex.R#L99)  | core tex function | use svg device: check if file created         | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L127) | core tex function | tex lines directly input: validate benchmark  | PASS   | 1 | 0.002 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.5.0 (2018-04-23)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS High Sierra 10.13.5           |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.0   |
| covr     | 3.1.0   |
| covrpage | 0.0.52  |

</details>

<!--- Final Status : pass --->
