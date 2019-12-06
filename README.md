utile
=====

A set of personal functions to ease analysis in R.

Analysis
--------

The function `count_percentage` allows you to count the observations per
group and compute the associated percentage.

For instance, count\_percentage will return for the iris dataset

``` r
library(utile)
count_percentage(iris, Species, digits = 1)
```

    ## # A tibble: 3 x 3
    ##   Species        n percentage
    ##   <fct>      <int>      <dbl>
    ## 1 setosa        50       33.3
    ## 2 versicolor    50       33.3
    ## 3 virginica     50       33.3

Visualisation
-------------
