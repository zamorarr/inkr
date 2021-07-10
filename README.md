
<!-- README.md is generated from README.Rmd. Please edit that file -->

# inkr

<!-- badges: start -->
<!-- badges: end -->

This is an R port of inkle’s [ink](https://github.com/inkle/ink), a
scripting language for writing interactive narrative. The port is not
written in native R but instead provides an interface to
[inkjs](https://github.com/y-lohse/inkjs) due to its ease of use and
feature completeness.

## Installation

You can install the released version of inkr from [github]() with:

``` r
remotes::install_github("zamorarr/inkr")
```

## Example

Playing a JSON version of an Ink story in R:

``` r
library(inkr)
storyfile <- system.file("examples", "the-intercept.json", package = "inkr")
play_story(storyfile)
```
