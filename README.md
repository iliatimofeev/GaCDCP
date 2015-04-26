# Geting and Cleaning Data Course Project

As described in task script is in ['run_analysis.R'](.\run_analysis.R)

Tested on Win7 R 3.1.3 x64

If `"UCI HAR Dataset"` folder don't  exist in working directory script downloads data and unpack it.

Transformation logic is described in ['CodeBook.md'](.\CodeBook.md)

Results stored in `'tidy_data_set.txt'`


## dependences 
* `require("data.table")` - transformation mostly performed by data.table     
* `require("curl")` - https download under windows
* `require("stringr")` - string tools
