#2.1

#'@description splits string into characters
#'@param x is a string to be splitted
#'@return a vector of characters splitted from the givven string
split_chars <- function(x="Go Bears"){
  return(str_split(x, pattern = ""))
}



#2.2
#'@description counts number of vowels in a string
#'@param x is a string to be analysed
#'@return a vector of numbers with the name of the corresponding vowels
num_vowels <- function(x = "Go Bears!"){
  vowels <- c("a", "e", "i", "o", "u")
  vowel_count <- c()
  for (i in c(1:5)) {
    vowel_count[i] <- str_count(x, pattern = vowels[i])
  }
  `names<-`(vowel_count, vowels)
}


#2.3
#'@description counts number of vowels in a string using split_chars() and num_vowels
#'@param x is a string to be analysed
#'@return a vector of numbers with the name of the corresponding vowels
count_vowels <- function(x = "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG"){
  x <- str_to_lower(x)
  return(num_vowels(x))
}


#2.4
#'@description reverses the order of characters in the string
#'@param x is a string to be analysed
#'@return reversed string
reverse_chars <-function(x = "Lumax Maxima"){
y <- str_split(x, "")
  z <- c()
  for (i in c(1:nchar(x))) {
    z[i] <- y[[1]][nchar(x)-(i-1)]
  }
  return(str_flatten(z, collapse = ""))
}


#2.5
#'@description reverses the order of words in the string
#'@param x is a string to be analysed
#'@return reversed worded string
reverse_words <-function(x = "sentence! this reverse"){
 y <- str_split(x, " ")
 z <- c()
 for (i in c(1:length(y[[1]]))){
   z[i] <- y[[1]][length(y[[1]])-(i-1)]
 }
 return(str_flatten(z, collapse = " "))
}

