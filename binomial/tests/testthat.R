library(testthat)
library(binomial)

test_file("~/hw-stat133/binomial/tests/testthat/test-check-checkers.R")
test_file("~/hw-stat133/binomial/tests/testthat/test-check-summary.R")
test_file("~/hw-stat133/binomial/tests/testthat/test-check-binomials.R")

test_check("binominal")
