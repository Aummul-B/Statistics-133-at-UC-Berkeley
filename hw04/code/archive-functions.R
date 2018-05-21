
#function that reads the html file frm the web
#' @description reading the archive logs of the 
#' @param string package name
#' @return table of all the stuff from the package

read_archive <- function(x = "stringr"){
  return(readHTMLTable(paste0("http://cran.r-project.org/src/contrib/Archive/", x)))
}



#functions that manipulate the trings to get the desired form.
#These functions would be callef in the function clean_archive
#' @description set of 4 string manipulation functions
#' @param string takes in input a string
#' @return the manipulated string

SPLIT_NAME <- function(x = "stringr_76324579.tar.gz"){
  return(str_split(x, pattern = "_")[[1]])
}
SUBS_VERSION <- function(x = "stringr_749485938.tar.gz"){
  return(substr(x,  start = 1, stop = nchar(x)-7 ))
}

SPLIT_DATE <- function(x = vector){
  return(str_split(x, pattern = " ")[[1]])
}

SUBS_SIZE <- function(x = vector){
  substr(x, start = 1, stop = nchar(x)-1)
}

GET_UNITS <- function(x = vector){
  substr(x, start = nchar(x), stop = nchar(x))
}

CLEAN_DATAFRAME <- function(raw_data){
  cleaner <- as.data.frame(raw_data)
  cleaner <- cleaner[1:ncol(cleaner)-1]
  cleaner <- cleaner[3:(nrow(cleaner)-1), ]
  colnames(cleaner) <- c("name", "version", "date", "size")
  row.names(cleaner) <- c(1:nrow(cleaner))
  return(cleaner)
}


#function to get the size data
#' @description takes the raw size data in character
#' @param x is the raw size data
#' @return cleaned size data

#The main clean archive function
#'@description takes the output of read_archive() and returns a tidy table
#'@param table from read_archive function
#'@return table but a tidy one :)

clean_archive <- function(x = "raw data table"){
  #Cleaning the data frame
  x=raw_data
  cleaner <- CLEAN_DATAFRAME(x)
  
  #cleaning the first column
  name_of_package <- SPLIT_NAME(cleaner[[2]][1])[1]
  cleaner[[1]] <- c(name_of_package)
  
  #cleaning the second column
  version_with_tail <- sapply(cleaner[[2]], SPLIT_NAME)
  vec_version_tail <- as.vector(version_with_tail[2, ])
  version <- sapply(vec_version_tail, FUN = SUBS_VERSION)
  cleaner[[2]] <- version
  
  #cleaning the third column
  cleaner[[3]] <- sapply(cleaner$date, SPLIT_DATE)[1, ]
  cleaner[[3]] <- as.Date(cleaner[[3]])
  
  #cleaning the fourth column
  cleaner[[4]] <- as.character(cleaner[[4]])
  Units_version <- sapply(cleaner[[4]], FUN = GET_UNITS)
  cleaner[[4]] <- sapply(cleaner[[4]], SUBS_SIZE)
  cleaner[[4]] <- as.numeric(cleaner[[4]])
  i <- 1
  while (i<=nrow(cleaner)) {
    if(Units_version[i]=="M"){
      cleaner[[4]][i] <- cleaner[[4]][i]*1000
    }
    i <- i + 1
  } 
  
  #reaffirming the data types
  class(cleaner$name) <- "character"
  class(cleaner$version) <- "character"
  class(cleaner$date) <- "Date"
  class(cleaner$size) <- "numeric"
  
  return(cleaner)
}



#function to visualize the timeline with version sized=s of a package.
#'@description plots the fuction between date and package size
#'@param x is a dataframe of the clean data
#'@return the plot
plot_archive <- function(x = "clean_data_frame"){
  ggplot(data = x, mapping = aes(x = date, y = size))+
    geom_step(col = "royal blue1", lwd = 1)+
    theme_bw()+
    geom_point(col = "royalblue4")+
    labs(y = "Size(Kilobytes)", title = paste0(x[[1]][2], ": timeline of version sizes"))
}


