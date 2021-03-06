
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

## They are keeping me waiting.
##
## [1] Hut 14
##
## Choice: 1
## ---------------------------------
## Hut 14. The door was locked after I sat down.
## I don't even have a pen to do any work. There's a copy of the morning's intercept in my pocket, but staring at the jumbled letters will only drive me mad.
## I am not a machine, whatever they say about me.
##
## [1] Think
## [2] Plan
## [3] Wait

## Choice: 
```
