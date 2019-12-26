utile
=====

A set of utility functions to ease analysis in R.

Author: Shezad T.  
Starting date: 12/2019

The function `count_percentage` allows you to count the observations per
group and compute the associated percentage.

For instance, count\_percentage will return the following for the iris
dataset

``` r
# Load the library
library(utile)

# Count the percentage of Species in the iris dataset
count_percentage(iris, Species, digits = 1)
```

    ## # A tibble: 3 x 3
    ##   Species        n percentage
    ##   <fct>      <int>      <dbl>
    ## 1 setosa        50       33.3
    ## 2 versicolor    50       33.3
    ## 3 virginica     50       33.3

The function `export_charts_ppt` allows you to export a list of ggplots
into a PowerPoint file.

For instance:

``` r
# Load the libraries
library(utile)
library(ggplot2)

# Create an empty list to store the plots
listP <- list()

# Store a plot
listP[["first_chart"]] <- ggplot(data = iris) +
geom_point(mapping = aes(Sepal.Length, Petal.Length))

# Export the plots in a PowerPoint file named my_plots.pptx
export_charts_ppt(listP, export_path = "my_plots.pptx")
```
