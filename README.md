# Geting and Cleaning Data Course Project
### my second attempt to get it
As described in task script is in ['run_analysis.R'](https://github.com/iliatimofeev/GaCDCP/blob/master/run_analysis.R)

Tested on Win7 R 3.1.3 x64

If `"UCI HAR Dataset"` folder don't  exist in working directory script downloads data and unpack it.

Transformation logic is described in ['CodeBook.md'](https://github.com/iliatimofeev/GaCDCP/blob/master/CodeBook.md#codebook)

Results stored in `'tidy_data_set.txt'`


## dependences 
* `require("data.table")` - transformation mostly performed by data.table     
* `require("curl")` - https download under windows
* `require("stringr")` - string tools
