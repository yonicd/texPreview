Tests and Coverage
================
13 September, 2018 11:03:43

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                        | Coverage (%) |
| :-------------------------------------------- | :----------: |
| texPreview                                    |    63.44     |
| [R/buildUsepackage.R](../R/buildUsepackage.R) |     0.00     |
| [R/getTexPackages.R](../R/getTexPackages.R)   |     0.00     |
| [R/texAddin.R](../R/texAddin.R)               |     0.00     |
| [R/defaults.R](../R/defaults.R)               |     6.06     |
| [R/tex\_dir\_setup.R](../R/tex_dir_setup.R)   |    78.95     |
| [R/tex\_return.R](../R/tex_return.R)          |    80.00     |
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
| test-tex.R | [test-tex.R](testthat/test-tex.R) | 9 | 0.626 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                   | context           | test                                          | status | n |  time |
| :------------------------------------- | :---------------- | :-------------------------------------------- | :----- | -: | ----: |
| [test-tex.R](testthat/test-tex.R#L31)  | core tex function | porting to tex: files generated               | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L35)  | core tex function | porting to tex: class of output               | PASS   | 1 | 0.001 |
| [test-tex.R](testthat/test-tex.R#L49)  | core tex function | porting to tex no filedir: no files generated | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L53)  | core tex function | porting to tex no filedir: class of output    | PASS   | 1 | 0.001 |
| [test-tex.R](testthat/test-tex.R#L67)  | core tex function | keep pdf as an output: files generated        | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L71)  | core tex function | keep pdf as an output: class of output        | PASS   | 1 | 0.001 |
| [test-tex.R](testthat/test-tex.R#L86)  | core tex function | html output: return magick object             | PASS   | 1 | 0.613 |
| [test-tex.R](testthat/test-tex.R#L101) | core tex function | use svg device: check if file created         | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L129) | core tex function | tex lines directly input: validate benchmark  | PASS   | 1 | 0.002 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.5.1 (2018-07-02)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS High Sierra 10.13.5           |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.0   |
| covr     | 3.1.0   |
| covrpage | 0.0.55  |

</details>

<!--- Final Status : pass --->
