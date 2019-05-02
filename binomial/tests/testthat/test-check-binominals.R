
source("~/hw-stat133/binomial/R/Workout3_Yeongyu_Shin.R")

context("Test forbinomials") 

test_that("bin_choose() works as expected", {

  expect_equal(bin_choose(5, 2), 10)
  expect_equal(bin_choose(5, 1:3), c(5, 10, 10))
  expect_equal(bin_choose(10, 0), 1)
  
})

test_that("bin_probability() works as expected", {
  
  expect_equal(bin_probability(2, 5, 0.5), 0.3125)
  expect_error(bin_probability(6, 5, 0.2), "#success cannot be greater than trials", fixed  = TRUE)
  expect_error(bin_probability(4, 0.2, 0.5), "#of trias has to be an integer", fixed = TRUE)
  
})

test_that("bin_distribution() works as expected", {
  success <- c(0,1,2,3,4,5)
  probability <- c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125)
  a <- data.frame(success, probability)
  
  expect_equal(bin_distribution(5, 0.5), a)
  expect_error(bin_distribution(5, 1.2), "p has to be  a number between 0 and 1", fixed  = TRUE)
  expect_error(bin_distribution(0.2, 0.5), "#of trias has to be an integer", fixed = TRUE)
  
})

test_that("bin_distribution() works as expected", {
  success <- c(0,1,2,3,4,5)
  probability <- c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125)
  culmulative <- c(0.03125, 0.18750, 0.50000, 0.81250, 0.96875, 1.00000)
  a <- data.frame(success, probability, culmulative)
  
  expect_error(bin_distribution(c(1,2), 0.5), "#of trias has to be an integer", fixed = TRUE)
  expect_error(bin_distribution(5, 1.2), "p has to be  a number between 0 and 1", fixed  = TRUE)
  expect_error(bin_distribution(0.2, 0.5), "#of trias has to be an integer", fixed = TRUE)
  
})