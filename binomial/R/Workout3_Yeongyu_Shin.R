# 1.1) Private Checker Functions

#description: check if an input is a valid probability value
check_prob <- function(prob){
  if (prob > 1 | prob < 0 | length(prob) != 1) {
    stop("p has to be  a number between 0 and 1")
  }
  else {
    return(TRUE)
  }
}


#description: check if # of trials is a valid value
check_trials <- function(trials){
  if (trials != trunc(trials) | length(trials) != 1) {
    stop("#of trias has to be an integer")
  }
  else if (trials < 0) {
    stop("#of trias has to be non-negative")
  }
  else {
    return(TRUE)
  }
}

#description: check if # of success is a valid value
check_success <- function(success, trials){
  if (sum(success) > trials) {
    stop("#success cannot be greater than trials")
  }
  else if (trials < 0 | success < 0 | length(trials) != 1 | length(success) != 1) {
    stop("#of trias and success has to be non-negative and length of 1")
  }
  else {
    return(TRUE)
  }
}

# 1.2) Private Auxiliary Functions

#description: compute binominal mean
aux_mean <- function(trials, prob){
  return(trials*prob)
}

#description: compute binominal variance
aux_variance <- function(trials, prob){
  return(trials*prob*(1-prob))
}
#description: compute binominal mean
aux_mode <- function(trials, prob){
  return(trunc(trials*prob + prob))
}

#description: compute binominal skewness
aux_skewness <- function(trials, prob){
  return((1-2*prob)/sqrt(trials*prob*(1-prob)))
}

aux_skewness(1, 0.2)

aux_kurtosis <- function(trials, prob){
  return((1 - 6 * prob * (1 - prob)) / trials / prob / (1 - prob))
}


# 1.3) Function bin_chosse()

#' @title bin_choose
#' @description compute binary combinations
#' @param n
#' @param k
#' @return  n choose k
#' @export
#' @examples bin_choose(5, 2) = 10
bin_choose <- function(n, k){
  if (k > n) {
    stop("k cannot be greater than n")
  }
  else{
    return(factorial(n) / factorial(k) / factorial(n - k))
  }
}

# 1.4) Function bin_probability()
#' @title bin_probability
#' @description compute binary probability
#' @param success
#' @param trials
#' @param prob
#' @return  binary probability
#' @export
#' @examples bin_choose(2, 5, 0.5) = 0.3125
bin_probability <- function(success, trials, prob){
if (check_prob(prob) & check_trials(trials) & check_success(success, trials)) {
  return(bin_choose(trials, success)* (prob^success) *(1 - prob)^(trials - success))
}
else{
  stop("invalid inputs")
}
}

# 1.5) Function bin_distribution()
#' @title bin_distribution
#' @description compute bin_distribution
#' @param trials
#' @param prob
#' @return  bin_distribution
#' @export
bin_distribution <- function(trials, prob){
  if (check_prob(prob) & check_trials(trials)) {
    success <- c()
    probability <- c()
    for (i in 0:trials){
      success[i+1] <- i
      probability[i+1] <- bin_probability(i, trials, prob)
    }
    return(data.frame(success, probability))
  }
  else{
    stop("invalid inputs")
  }
}

class(bin_distribution) <- c("bindis", "data.frame")
plot.bindis <- function(x){
  barplot(x$probability, ylab = "Probability", xlab = "Success", names.arg = x$success)
}



# 1.6) Function bin_culmulative()
#' @title bin_culmulative
#' @description compute bin_culmulative
#' @param trials
#' @param prob
#' @return  bin_culmulative
#' @export
bin_culmulative <- function(trials, prob){
  if (check_prob(prob) & check_trials(trials)) {
    success <- c()
    probability <- c()
    culmulative <- c()
    for (i in 0:trials){
      success[i+1] <- i
      probability[i+1] <- bin_probability(i, trials, prob)
    }
    culmulative[1] <- probability[1]
    if (trials >= 1) {
      for (i in 0:(trials-1)){
        culmulative[i+2] <- culmulative[i+1] + probability[i+2]
      }
    }
    return(data.frame(success, probability, culmulative))
  }
  else{
    stop("invalid inputs")
  }
}

class(bin_culmulative) <- "bincum"
plot.bincum <- function(x){
  plot(x$success, x$culmulative, type = "b", xlab = "Success", ylab = "Culmulative")
}

# 1.7) Function bin_variable()
#' @title bin_variablee
#' @description compute bin_variable
#' @param trials
#' @param prob
#' @return  bin_variable
#' @export
bin_variable <- function(trials, prob){
  if (check_prob(prob) & check_trials(trials)) {
    success <- trials
    probability <- prob
    lst <- list(success, probability)
    class(lst) <- "binvar"
    return(lst)
  }
  else{
    stop("invalid inputs")
  }
}

print.binvar <- function(x){
  print( "Binominal Variable")
  print("Parameters", quote = FALSE)
  
  print(c("-number of  trials:", x[[1]]), quote = FALSE)
  print(c("-prob   of success:", x[[2]]), quote = FALSE)
}

summary.binvar <- function(x){
  trials <- x[[1]]
  prob <- x[[2]]
  smean <- aux_mean(trials, prob)
  svariance <- aux_variance(trials, prob)
  smode <- aux_mode(trials, prob)
  sskewness <- aux_skewness(trials, prob)
  skurtosis <- aux_kurtosis(trials, prob)
  lst <- list(trials, prob, smean, svariance, smode, sskewness, skurtosis)
  class(lst) <- "summary.binvar"
  return(lst)
}

print.summary.binvar <- function(x){
  print("Summary Binominal")
  print("Parameters", quote = FALSE)
  print(c("-number of  trials:", x[[1]]), quote = FALSE)
  print(c("-prob   of success:", x[[2]]), quote = FALSE)
  print("Measures", quote = FALSE)
  print(c(" mean    :", x[[3]]), quote = FALSE)
  print(c(" variance:", x[[4]]), quote = FALSE)
  print(c(" mode    :", x[[5]]), quote = FALSE)
  print(c(" skewness:", x[[6]]), quote = FALSE)
  print(c(" kurtosis:", x[[7]]), quote = FALSE)
}

#1.8) Functions of measures

bin_mean <- function(trials, prob){
  if (check_prob(prob) & check_trials(trials)) {
    return(aux_mean(trials, prob))
  }
  else{
    stop("invalid inputs")
  }
}
bin_variance <- function(trials, prob){
  if (check_prob(prob) & check_trials(trials)) {
    return(aux_variance(trials, prob))
  }
  else{
    stop("invalid inputs")
  }
}
bin_mode <- function(trials, prob){
  if (check_prob(prob) & check_trials(trials)) {
    return(aux_mode(trials, prob))
  }
  else{
    stop("invalid inputs")
  }
}
bin_skewness <- function(trials, prob){
  if (check_prob(prob) & check_trials(trials)) {
    return(aux_skewness(trials, prob))
  }
  else{
    stop("invalid inputs")
  }
}
bin_kurtosis <- function(trials, prob){
  if (check_prob(prob) & check_trials(trials)) {
    return(aux_kurtosis(trials, prob))
  }
  else{
    stop("invalid inputs")
  }
}
bin_mean <- function(trials, prob){
  if (check_prob(prob) & check_trials(trials)) {
    return(aux_mean(trials, prob))
  }
  else{
    stop("invalid inputs")
  }
}


#2) Tests

