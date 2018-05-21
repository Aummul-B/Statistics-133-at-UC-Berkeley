hw-03-Aummul-Manasawala
================
Aummul Baneen Manasawala
March 21, 2018

### Q 2.1

``` bash
cut -d "," -f 2 nba2017-roster.csv | tail +2 | sort -u > team-names.txt
head -5 team-names.txt
```

    ## Error in running command bash

### Q 2.2

``` bash
cut -d "," -f 3 nba2017-roster.csv | tail +2 | sort -u > position-names.txt
head -5 position-names.txt
```

    ## Error in running command bash

### Q 2.3

``` bash
cut -d "," -f 7 nba2017-roster.csv | tail +2 | sort | uniq -c | sort -r > experience-counts.txt
head -5 experience-counts.txt
```

    ## Error in running command bash

### Q 2.4

``` bash
grep -E 'LAC|team' nba2017-roster.csv > LAC.csv
cat LAC.csv
```

    ## Error in running command bash

### Q 2.5

``` bash
grep "LAL" nba2017-roster.csv | cut -d "," -f 6 | sort | uniq -c
```

    ## Error in running command bash

### Q 2.6

``` bash
grep -c "CLE" nba2017-roster.csv
```

    ## Error in running command bash

### Q 2.7

``` bash
grep -E "GSW|team" nba2017-roster.csv | cut -d "," -f 1,4,5 > gsw-height-weight.csv
cat gsw-height-weight.csv
```

    ## Error in running command bash

### Q 2.8

``` bash
cut -d "," -f 1,8 nba2017-roster.csv | head -n 1 > top10-salaries.csv
cut -d "," -f 1,8 nba2017-roster.csv | tail +2| sort -n -t "," -k 2 -r|head -10 >> top10-salaries.csv
cat top10-salaries.csv
```

    ## Error in running command bash

Using the binomial-functions
----------------------------

``` r
source("code/binomial-functions.R", local = F)
bin_probability(trials = 10, success = 3, prob = (1/6))
```

    ## [1] 0.1550454

``` r
dist_six <- bin_distribution(trials = 10, prob = 0.25)
dist_six
```

    ##    success  probability
    ## 1        0 5.631351e-02
    ## 2        1 1.877117e-01
    ## 3        2 2.815676e-01
    ## 4        3 2.502823e-01
    ## 5        4 1.459980e-01
    ## 6        5 5.839920e-02
    ## 7        6 1.622200e-02
    ## 8        7 3.089905e-03
    ## 9        8 3.862381e-04
    ## 10       9 2.861023e-05
    ## 11      10 9.536743e-07

``` r
plot(dist_six, xlab = "number of sixes in 10 trials", ylab = "probability", main = "Distribution of probability of no of six in 10 trials")
```

![](images/distribution%20of%20probability%20of%20number%20of%20sixes%20in%2010%20trials-1.png)

``` r
#Getting more than 3 heads in 5 tosses, p = 0.35
prob_more_than_three <- 0
for (i in 4:5) {
  prob_more_than_three <- prob_more_than_three + bin_probability(trials = 5, success = i, prob = 0.35)
}
prob_more_than_three
```

    ## [1] 0.0540225

``` r
dist_heads <- bin_distribution(trials = 15, prob = 0.35)
dist_heads
```

    ##    success  probability
    ## 1        0 1.562069e-03
    ## 2        1 1.261672e-02
    ## 3        2 4.755531e-02
    ## 4        3 1.109624e-01
    ## 5        4 1.792469e-01
    ## 6        5 2.123387e-01
    ## 7        6 1.905604e-01
    ## 8        7 1.319264e-01
    ## 9        8 7.103729e-02
    ## 10       9 2.975066e-02
    ## 11      10 9.611752e-03
    ## 12      11 2.352527e-03
    ## 13      12 4.222484e-04
    ## 14      13 5.246873e-05
    ## 15      14 4.036056e-06
    ## 16      15 1.448841e-07

``` r
plot(dist_heads, xlab = "number of heads in 15 trials", ylab = "probability", main = "Distribution of probability of no of heads in 15 trials")
```

![](images/distribution%20of%20probability%20of%20number%20of%20heads%20in%2015%20trials-1.png)
