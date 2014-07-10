cats
====

An R package for cat-related functions, as originally [outlined on Hilary's blog](http://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/), and brought to life by [#rcatladies](https://twitter.com/search?src=typd&q=%23rcatladies).


## Testing

The cat related functions are tested with [testthat](https://github.com/hadley/testthat), and can be run in an R console with

     library(testthat)
     test_file('tests/testthat.R')
Or from the command line (assuming you are in the `cats` folder) with

    cd .. && r CMD check cats && cd -
If you see

    Running ‘testthat.R’
    OK
You didn't break anything! Or possibly didn't add tests for new things you've added.

There is also a .travis.yml file which, if you have an account on [Travis CI](http://travis-ci.org), will automatically run tests and ensure this can still be packaged when changes are made. The image below shows the current test & package build success status on the master branch of markolson/cats. Update to suit. 

[![Build Status](https://travis-ci.org/markolson/cats.svg?branch=master)](https://travis-ci.org/markolson/cats)
