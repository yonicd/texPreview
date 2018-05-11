Tests and Coverage
================
11 May, 2018 12:22:10

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                        | Coverage (%) |
| :-------------------------------------------- | :----------: |
| texPreview                                    |    69.75     |
| [R/defaults.R](../R/defaults.R)               |     6.06     |
| [R/texAddin.R](../R/texAddin.R)               |     9.09     |
| [R/getTexPackages.R](../R/getTexPackages.R)   |    85.00     |
| [R/buildUsepackage.R](../R/buildUsepackage.R) |    94.44     |
| [R/texPreview.R](../R/texPreview.R)           |    95.00     |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                        | n |  time | error | failed | skipped | warning |
| :------------------------------------------ | -: | ----: | ----: | -----: | ------: | ------: |
| [test-tex.R](testthat/test-tex.R)           | 9 | 3.711 |     0 |      0 |       0 |       0 |
| [test-utilites.R](testthat/test-utilites.R) | 9 | 4.179 |     0 |      0 |       0 |       0 |

| file                                        | test                            | context                   | status | n |  time |
| :------------------------------------------ | :------------------------------ | :------------------------ | :----- | -: | ----: |
| [test-tex.R](testthat/test-tex.R)           | porting to tex                  | core tex function         | PASS   | 2 | 0.617 |
| [test-tex.R](testthat/test-tex.R)           | porting to tex no filedir       | core tex function         | PASS   | 2 | 0.563 |
| [test-tex.R](testthat/test-tex.R)           | keep\_pdf                       | core tex function         | PASS   | 2 | 0.624 |
| [test-tex.R](testthat/test-tex.R)           | html                            | core tex function         | PASS   | 1 | 0.623 |
| [test-tex.R](testthat/test-tex.R)           | svg                             | core tex function         | PASS   | 1 | 0.661 |
| [test-tex.R](testthat/test-tex.R)           | tex lines                       | core tex function         | PASS   | 1 | 0.623 |
| [test-utilites.R](testthat/test-utilites.R) | build usepackage call           | test for usepackage       | PASS   | 4 | 2.501 |
| [test-utilites.R](testthat/test-utilites.R) | build usepackage multiple calls | test for usepackage       | PASS   | 2 | 0.003 |
| [test-utilites.R](testthat/test-utilites.R) | find packages                   | find install tex packages | PASS   | 2 | 1.673 |
| [test-utilites.R](testthat/test-utilites.R) | empty call                      | addin                     | PASS   | 1 | 0.002 |
