
Overview
--------

`"binomial` is a package that provides functions helpful in computing binomials

-   `bin_choose` computes choose n k
-   `bin_distribution` build a table with \# of success and probs.
-   `bin_cumulatve` build a table on top of distribution a collumn for culmulative.
-   `bin_probability` computes binomial probability.
-   `bin_variable` useful for computng various statistics given binomials.

Motivation
----------

This package has been created for users who have to compute binomials but don't want to go thorugh hassles of making thier own custom functions.

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

Usage
-----

``` r
library(binomial)
# checkers
check_trials(5)
#> [1] TRUE
check_prob(0.5)
#> [1] TRUE
check_success(2, 2)
#> [1] TRUE
# auxiliaries
aux_kurtosis(5, 0.5)
#> [1] -0.4
aux_mean(5, 0.5)
#> [1] 2.5
aux_mode(5, 0.5)
#> [1] 3
aux_variance(5, 0.5)
#> [1] 1.25
aux_skewness(5, 0.5)
#> [1] 0
# binomials functions
bin_choose(5, 2)
#> [1] 10
bin_probability(2, 3, 0.5)
#> [1] 0.375
bin_distribution(5, 0.5)
#>   success probability
#> 1       0     0.03125
#> 2       1     0.15625
#> 3       2     0.31250
#> 4       3     0.31250
#> 5       4     0.15625
#> 6       5     0.03125
bin_culmulative(5, 0.5)
#>   success probability culmulative
#> 1       0     0.03125     0.03125
#> 2       1     0.15625     0.18750
#> 3       2     0.31250     0.50000
#> 4       3     0.31250     0.81250
#> 5       4     0.15625     0.96875
#> 6       5     0.03125     1.00000
bin_variable(5, 0.5)
#> [1] "Binominal Variable"
#> [1] Parameters
#> [1] -number of  trials: 5                  
#> [1] -prob   of success: 0.5
```
