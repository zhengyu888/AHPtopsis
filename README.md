
<!-- README.md is generated from README.Rmd. Please edit that file -->

# AHPTopsis

<!-- badges: start -->
<!-- badges: end -->

The goal of AHPTopsis is to provide a analytic hierarchy process
weighted TOPSIS method for multiple-criteria decision making (MCDM).

## Installation

You can install WtTopsis like so:

``` r
devtools::install_github("zhengyu888/AHPtopsis")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(AHPtopsis)
sampleData<-sampleData
MatixData<-MatixData
mth<-c("ZH","ZJ","QJ","ZH","FU","ZH","QJ","FU","FU","ZH")
zmth<-c(NA,NA,NA,NA,"CZ",NA,NA,"DS","CZ",NA)
xbest<-c(NA,4,NA,NA,NA,NA,NA,NA,NA,NA)
qup<-c(NA,NA,5,NA,NA,NA,5,NA,NA,NA)
qlow<-c(NA,NA,3,NA,NA,NA,3,NA,NA,NA)
maxdata<-data2max(sampleData,mth,zmth,xbest,qlow,qup)
normaldata<-DataNormal(maxdata)
weightdata<-AHPWeight(MatixData)
Cvalue1<-AHPTopsisN(normaldata,MatixData)
Cvalue2<-AHPTopsis(sampleData,MatixData,mth,zmth,xbest,qlow,qup)
## basic example code
```
