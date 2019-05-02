
source("~/hw-stat133/binomial/R/Workout3_Yeongyu_Shin.R")

context("Test for check_prob()") 

test_that("check_prob works as expected", {
  x <- 0.5
  y <- 1.5
  z <- c(0.2, 0.2)
  
  expect_equal(check_prob(x), TRUE)
  expect_error(check_prob(y), "p has to be  a number between 0 and 1", fixed = TRUE)
  expect_error(check_prob(z), "p has to be  a number between 0 and 1", fixed = TRUE)
})

test_that("check_trials() works as expected", {
  x <- 6
  y <- 1.5
  z <- c(0.2, 0.2)
  a <- -5
  
  expect_equal(check_trials(x), TRUE)
  expect_error(check_trials(y), "#of trias has to be an integer", fixed = TRUE)
  expect_error(check_trials(z), "#of trias has to be an integer", fixed = TRUE)
  expect_error(check_trials(a), "#of trias has to be non-negative", fixed = TRUE)
})

test_that("check_success works as expected", {
  
  expect_equal(check_success(2, 5), TRUE)
  expect_error(check_success(6, 3), "#success cannot be greater than trials", fixed = TRUE)
  expect_error(check_success(-1, 3), "#of trias and success has to be non-negative and length of 1", fixed = TRUE)
  expect_error(check_success(c(1,2), 2), "#success cannot be greater than trials", fixed = TRUE)
})

