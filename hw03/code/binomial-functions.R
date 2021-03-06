#FUnction is_integer()

#' @title is_integer
#' @description checks whether the number is an integer or not
#' @param x number to be checked
#' @return TRUE or FALSE
 is_integer <- function(x){
   if (x%%1 == 0){
     return(TRUE)
   }
   else{
     return(FALSE)
   }
 }
 
 #Testing is_integer()
 #TRUES
 assertthat::assert_that(is_integer(-1) == TRUE)
 assertthat::assert_that(is_integer(0) == TRUE)
 assertthat::assert_that(is_integer(2L) == TRUE)
 assertthat::assert_that(is_integer(2) == TRUE)
 #FALSE
 assertthat::assert_that(is_integer(2.1) == FALSE)
 assertthat::are_equal(is_integer(pi), FALSE)
 assertthat::are_equal(is_integer(0.01), FALSE)

 
 
 
 #Function is_positive()
 
 #' @title is_positive
 #' @description checks whether the number is positive or not
 #' @param x number to be checked
 #' @return TRUE or FALSE
 
 is_positive <- function(x){
   if(x>0){
     return(TRUE)
   }
   else{
     return(FALSE)
   }
 }
 
 #Testing is_positive()
 #TRUES
 assertthat::assert_that(is_positive(0.01) == TRUE)
 assertthat::assert_that(is_positive(2) == TRUE)
 #FALSE''s
 assertthat::assert_that(is_positive(-2) == FALSE)
 assertthat::are_equal(is_positive(0), FALSE)
 
 
 
 
 
 #Function is_nonnegative()
 
 #' @title is_nonnegative
 #' @description checks whether the number is non negative or not
 #' @param x number to be checked
 #' @return TRUE or FALSE
 
 is_nonnegative <- function(x){
   if(x>=0){
     return(TRUE)
   }
   else{
     return(FALSE)
   }
 }
 
 #Testing is_nonnegative()
 #TRUES
 assertthat::assert_that(is_nonnegative(0) == TRUE)
 assertthat::assert_that(is_nonnegative(2) == TRUE)
 #FALSE''s
 assertthat::assert_that(is_nonnegative(-2) == FALSE)
 assertthat::are_equal(is_nonnegative(-0.000001), FALSE)
 
 
 #Function is_positive_integer()
 
 #' @title is_positive_integer
 #' @description checks whether the number is a positive as well as a integer or not
 #' @param x number to be checked
 #' @return TRUE or FALSE
 
 is_positive_integer <- function(x){
   if(is_positive(x) & is_integer(x) == TRUE){
     return(TRUE)
   }
   else{
     return(FALSE)
   }
 }
 
 #Testing is_positive_integer()
 #TRUES
 assertthat::assert_that(is_positive_integer(2L) == TRUE)
 assertthat::assert_that(is_positive_integer(2) == TRUE)
 #FALSEs
 assertthat::assert_that(is_positive_integer(-2) == FALSE)
 assertthat::are_equal(is_positive_integer(0), FALSE)
 
 
 
 #Function is_nonneg_integer()
 
 #' @title is_nonneg_integer
 #' @description checks whether the number is non negative as well as a integer or not
 #' @param x number to be checked
 #' @return TRUE or FALSE
 
 is_nonneg_integer <- function(x){
   if(is_nonnegative(x) & is_integer(x) == TRUE){
     return(TRUE)
   }
   else{
     return(FALSE)
   }
 }
 
 #Testing is_nonneg_integer()
 #TRUES
 assertthat::assert_that(is_nonneg_integer(0) == TRUE)
 assertthat::assert_that(is_nonneg_integer(1) == TRUE)
 #FALSEs
 assertthat::assert_that(is_nonneg_integer(-1) == FALSE)
 assertthat::are_equal(is_nonneg_integer(-2.5), FALSE)
 
 
 
 #Function is_probability()
 
 #' @title is_probability
 #' @description checks whether the number is a valid probability or not
 #' @param x number to be checked
 #' @return TRUE or FALSE
 
 is_probability <- function(x){
   if(x >= 0 & x <= 1){
     return(TRUE)
   }
   else{
     return(FALSE)
   }
 }
 
 #Testing is_probability()
 #TRUES
 assertthat::assert_that(is_probability(0) == TRUE)
 assertthat::assert_that(is_probability(0.5) == TRUE)
 assertthat::assert_that(is_probability(1) == TRUE)
 
  #FALSEs
 assertthat::assert_that(is_probability(-1) == FALSE)
 assertthat::are_equal(is_probability(1.000000000001), FALSE)
 
 
 
 #Function bin_factorial()
 
 #' @title bin_factorial
 #' @description calculates the factorial of a non negative number
 #' @param x number whose factorial has to be calculated
 #' @return the factorial of the number

bin_factorial <- function(x){
   if(x == 0){
     return(1)
   }
   else{
     fact <- 1
     for(i in 1:x){
       fact <- fact * i
     }
     return(fact)
   }
}   
 
 #Testing bin_factorial()
 bin_factorial(5)
 bin_factorial(0)
 
 
 #Function bin_combinations()
 
 #' @title bin_combinations
 #' @description calculates the number of combinations of a choosing some number from some another
 #' @param n number from which the selection would take place
 #' @param k the number of items to be chosen from n
 #' @return the number of combinations
 
 bin_combinations <- function(n = 1, k = 1){
   return(bin_factorial(n)/(bin_factorial(k)*bin_factorial(n-k)))
 }   
 
 #Testing bin_combinations()
 bin_combinations(n = 5, k = 2)
 bin_combinations(10, 3)
 bin_combinations(4, 4)
 
 
 
 #Function bin_probability()
 
 #' @title bin_probability
 #' @description calculates the probability of k success amongst n trials
 #' @param trials number of trials
 #' @param success the number of success
 #' @param prob probability of success
 #' @return the binary probability calculaed
 
 bin_probability <- function(trials = 1, success = 1, prob = 1){
   if(is_nonnegative(trials) & is_nonneg_integer(success) == TRUE){
     if(is_probability(prob)== TRUE){
       return((prob^success)*((1-prob)^(trials - success))*bin_combinations(n = trials, k = success))
     }
     else{
       stop("Invalid probability")
     }
   }
   else{
     stop("Invalid number of trials or success. Trials and success need to be non negative integer")
   }
 }
 
 #Testing bin_probability()
 bin_probability(trials = 5, success = 2, prob = 0.5)
 
 
 
 #Function bin_distribution()
 
 #' @title bin_distribution
 #' @description makes a dataframe with the probability distribution of all the possible successes.
 #' @param trials number of trials that take place for an experiment
 #' @param prob probability of success in each trial
 #' @return a data frame giving the probability distribution of the number of success
 
 bin_distribution <- function(trials = 1, prob = 1){
   success <- c()
   probability <- c()
   for(i in 0:trials){
     success[i+1] <- i
     probability[i+1] <- bin_probability(trials = trials, success = i, prob = prob)
   }
   return(cbind.data.frame(success, probability))
 }
 
 #Testing bin_distribution()
 bin_distribution(trials = 5, prob = 0.5)
 
 
 