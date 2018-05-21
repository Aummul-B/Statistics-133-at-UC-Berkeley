hw04-aummul-manasawala
================
Aummul
4/8/2018

``` r
library(knitr)
library(stringr)
```

    ## Warning: package 'stringr' was built under R version 3.4.4

``` r
library(XML)
library(ggplot2)
library(readr)
```

1) Archive of an R ackage
=========================

1.1 and 1.2 Reading Table, Data Cleaning and Exporting
------------------------------------------------------

``` r
source("../code/archive-functions.R")
raw_data <- read_archive("stringr")
clean_data <- clean_archive(raw_data)
clean_data
```

    ##       name version       date size
    ## 1  stringr  0.1.10 2009-11-09  6.8
    ## 2  stringr     0.2 2009-11-16 10.0
    ## 3  stringr     0.3 2010-02-15 11.0
    ## 4  stringr     0.4 2010-08-24 16.0
    ## 5  stringr     0.5 2011-06-30 18.0
    ## 6  stringr   0.6.1 2012-07-25 20.0
    ## 7  stringr   0.6.2 2012-12-06 20.0
    ## 8  stringr     0.6 2011-12-08 20.0
    ## 9  stringr   1.0.0 2015-04-30 34.0
    ## 10 stringr   1.1.0 2016-08-19 62.0
    ## 11 stringr   1.2.0 2017-02-18 92.0

``` r
write.csv(clean_data, file = '../data/stringr-archive.csv')
```

1.3 Timeline plot
-----------------

``` r
plot_archive(clean_data)
```

![](../images/plot%20of%20stringr%20timeline-1.png)

1.5 Archives of "dplyr", "ggplot", "XML", "knitr"
-------------------------------------------------

``` r
#exporting table and saving the data locally
raw_data <- read_archive("dplyr")
clean_data <- clean_archive(raw_data)
#write.csv(clean_data, file = '../data/dplyr-archive.csv')
```

``` r
dfggplot2 <- read.csv('../data/ggplot2-archive.csv')
dfdplyr <- read.csv('../data/dplyr-archive.csv')
dfknitr <- read.csv('../data/knitr-archive.csv')
dfXML <- read.csv('../data/XML-archive.csv')
mega_archives <- rbind(dfdplyr, dfggplot2, dfknitr, dfXML)
mega_archives$date <- as.Date(mega_archives$date)
```

``` r
ggplot(data = mega_archives, aes(x = date, y = size))+
  geom_step(aes(color = name), lwd = 1)+
  facet_wrap(~name, shrink = T, scales = "free")+
  labs(y = "Size(Kilobytes)", title = "All packages: timeline of version sizes")
```

![](../images/facet_wrapped%20package%20size%20timeline-1.png)

``` r
ggplot(data = mega_archives, mapping = aes(x = date, y = size))+
    geom_step(aes(col = name), lwd = 1)+
    labs(y = "Size(Kilobytes)", title = "All packages: timeline of version sizes")
```

![](../images/package%20size%20timeline-1.png)

3) Data "Emoticon in Text"
==========================

``` r
text_emoticon <- read.csv("../data/text-emoticon.csv", header = T, sep = ",", stringsAsFactors = FALSE)
tweet_content <- text_emoticon[[4]]
```

3.1) Number of Chaarcters per Tweet
-----------------------------------

``` r
count_char_per_tweet <- nchar(tweet_content)
summary(count_char_per_tweet)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    1.00   43.00   69.00   73.44  103.00  184.00

``` r
histogram_tweets_chars <- hist(count_char_per_tweet, breaks = seq(from = 0, to = max(count_char_per_tweet)+5, by = 5), main = "Histogram of No. of characters in a tweet!")
```

![](../images/histogram%20of%20number%20of%20characters%20in%20a%20tweet-1.png)

3.2) Number of Mentions
-----------------------

``` r
count_mentions <- c()
for (i in c(1:length(tweet_content))) {
  x <- str_split(tweet_content[i], pattern = " ")
  count_mentions[i] <- 0
  for(j in c(1 : length(x[[1]]))){
    if(str_sub(x[[1]][j], start = 1, end = 1)  =="@" & nchar(x[[1]][j]) <= 15){
      if(str_detect(str_sub(x[[1]][j], start = 2, end = nchar(x[[1]][j])), pattern = "\\w{1,15}+")==TRUE){
        count_mentions[i] <- count_mentions[i] + 1
      }
    }
  }
}
```

``` r
freq_mentions <- table(count_mentions)
freq_mentions
```

    ## count_mentions
    ##     0     1     2     3     4     5     6     8     9    10 
    ## 22266 17028   576    83    26    14     3     2     1     1

``` r
barplot(freq_mentions, main = "Barplot of the no. of mention's frequency", ylab = "Frequency", xlab = "No of mentions in a tweet")
```

![](../images/barplot%20mention%20frequency-1.png)

``` r
tweet_content[which(count_mentions==10)]
```

    ## [1] "last #ff  @Mel_Diesel @vja4041 @DemonFactory @shawnmcguirt @SEO_Web_Design @ChuckSwanson @agracing @confidentgolf @tluckow @legalblonde31"

3.3) Hashtags
-------------

``` r
count_hashtags <- c()
for(i in c(1:length(tweet_content))){
  x <- str_split(tweet_content[i], pattern = " ")
  count_hashtags[i] <- 0
  for(j in c(1 : length(x[[1]]))){
    if((str_sub(x[[1]][j], start = 1, end = 1)=="#" & str_detect(str_sub(x[[1]][j], start = 2, end = 2), pattern = "[0-9]")== FALSE & str_detect(str_sub(x[[1]][j], start = 2, end = nchar(x[[1]][j])), pattern = "[:punct:]")== FALSE)) {
      if(nchar(x[[1]][j])>1){
        if(str_detect(str_sub(x[[1]][j], start = 2, end = nchar(x[[1]][j])), pattern = (str_flatten(replicate((nchar(x[[1]][j])-1), "\\d"), collapse = "")))==FALSE){
        count_hashtags[i] <- count_hashtags[i] + 1
      }
      }
    }
  }
}
```

``` r
freq_hashtags <- table(count_hashtags)
freq_hashtags
```

    ## count_hashtags
    ##     0     1     2     3     5     7 
    ## 39331   601    54    12     1     1

``` r
barplot(freq_hashtags, main = "Barplot of the no. of hashtag's frequency", ylab = "Frequency", xlab = "No of hashtags in a tweet")
```

![](../images/barplot%20hashtags%20frequency-1.png)

``` r
#Average length of the hashtags
hashtag_len <- nchar(unlist(str_extract_all(tweet_content, '#[a-zA-Z][a-zA-Z0-9]*')))-1
avg_len <- mean(hashtag_len)
avg_len
```

    ## [1] 7.625

Average length of the hashtags is 7.625

``` r
#Most common length of the hashtags
hashtag_mode <- table(hashtag_len)

sort(hashtag_mode, decreasing = T)[1:2]
```

    ## hashtag_len
    ##  4  9 
    ## 97 97

The most common length of the hashtags is 9.
