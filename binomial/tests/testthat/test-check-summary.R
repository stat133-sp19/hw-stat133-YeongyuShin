
source("~/hw-stat133/binomial/R/Workout3_Yeongyu_Shin.R")

context("Test for summary measures()") 

test_that("aux_mean() works as expected", {

  expect_equal(aux_mean(5, 0.5), 2.5)
  expect_equal(aux_mean(3, 0.8), 2.4)
  expect_equal(aux_mean(10, 0.1), 1)
})

test_that("aux_variance() works as expected", {
  
  expect_equal(aux_variance(10, 0.5), 2.5)
  expect_equal(aux_variance(5, 0.8), 0.8)
  expect_equal(aux_variance(10, 0.1), 0.9)
})

test_that("aux_mode() works as expected", {
  
  expect_equal(aux_mode(5, 0.5), 3)
  expect_equal(aux_mode(3, 0.8), 3)
  expect_equal(aux_mode(10, 0.1), 1)
})

test_that("aux_skewness() works as expected", {
  
  expect_equal(aux_skewness(5, 0.5), 0)
  expect_equal(aux_skewness(3, 0.8), -0.8660254)
  expect_equal(aux_skewness(1, 0.2), 1.5)
})

test_that("aux_kurtosis() works as expected", {
  
  expect_equal(aux_kurtosis(5, 0.5), -0.4)
  expect_equal(aux_kurtosis(3, 0.8), 0.08333333)
  expect_equal(aux_kurtosis(10, 0.1), 0.5111111)
  
})
