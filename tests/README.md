Tests and Coverage
================
02 June, 2018 10:58:20

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                        | Coverage (%) |
| :-------------------------------------------- | :----------: |
| texPreview                                    |    70.12     |
| [R/defaults.R](../R/defaults.R)               |     6.06     |
| [R/texAddin.R](../R/texAddin.R)               |     9.09     |
| [R/getTexPackages.R](../R/getTexPackages.R)   |    85.00     |
| [R/buildUsepackage.R](../R/buildUsepackage.R) |    94.44     |
| [R/texPreview.R](../R/texPreview.R)           |    95.12     |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

|                 | file                                        | n |  time | error | failed | skipped | warning |
| --------------- | :------------------------------------------ | -: | ----: | ----: | -----: | ------: | ------: |
| test-tex.R      | [test-tex.R](testthat/test-tex.R)           | 9 | 0.747 |     0 |      0 |       0 |       0 |
| test-utilites.R | [test-utilites.R](testthat/test-utilites.R) | 9 | 2.994 |     0 |      0 |       0 |       0 |

| file                                            | context                      | test                                              | status | n |  time |
| :---------------------------------------------- | :--------------------------- | :------------------------------------------------ | :----- | -: | ----: |
| [test-tex.R](testthat/test-tex.R#L28)           | core tex function            | porting to tex: files generated                   | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L32)           | core tex function            | porting to tex: class of output                   | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L46)           | core tex function            | porting to tex no filedir: no files generated     | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L50)           | core tex function            | porting to tex no filedir: class of output        | PASS   | 1 | 0.003 |
| [test-tex.R](testthat/test-tex.R#L64)           | core tex function            | keep pdf as an output: files generated            | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L68)           | core tex function            | keep pdf as an output: class of output            | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L81)           | core tex function            | html output: print to console the html script     | PASS   | 1 | 0.728 |
| [test-tex.R](testthat/test-tex.R#L96)           | core tex function            | use svg device: check if file created             | PASS   | 1 | 0.004 |
| [test-tex.R](testthat/test-tex.R#L124)          | core tex function            | tex lines directly input: validate benchmark      | PASS   | 1 | 0.002 |
| [test-utilites.R](testthat/test-utilites.R#L8)  | utility functions of package | build usepackage call: basic call                 | PASS   | 1 | 0.002 |
| [test-utilites.R](testthat/test-utilites.R#L12) | utility functions of package | build usepackage call: check library is installed | PASS   | 1 | 1.424 |
| [test-utilites.R](testthat/test-utilites.R#L16) | utility functions of package | build usepackage call: add options                | PASS   | 1 | 0.002 |
| [test-utilites.R](testthat/test-utilites.R#L20) | utility functions of package | build usepackage call: use bad library name       | PASS   | 1 | 1.542 |
| [test-utilites.R](testthat/test-utilites.R#L39) | utility functions of package | build usepackage multiple calls: class            | PASS   | 1 | 0.005 |
| [test-utilites.R](testthat/test-utilites.R#L43) | utility functions of package | build usepackage multiple calls: dimension        | PASS   | 1 | 0.002 |
| [test-utilites.R](testthat/test-utilites.R#L55) | utility functions of package | find packages: check class                        | PASS   | 2 | 0.003 |
| [test-utilites.R](testthat/test-utilites.R#L71) | utility functions of package | empty call to addin: cause addin to crash         | PASS   | 1 | 0.014 |
