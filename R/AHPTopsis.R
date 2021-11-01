#' AHPTopsis
#' Weighted TOPSIS method for multiple-criteria decision making (MCDM).
#' @param data The Data that needs to be maximized.
#' @param  matrixdata Judgment matrix data.
#' @param mth A vector describing the type of each indicator.
#' @param zmth A vector describing the method from negative to positive, including DS: reciprocal method, it is not recommended to use when the data has 0, CZ: using the maximum subtraction method, other types of indicators are marked as NA.
#' @param xbest An optimal value vector of intermediate numerical values,other types of indicators are marked as NA.
#' @param qlow An interval lower bound vector with interval numeric value forward,other types of indicators are marked as NA.
#' @param qup An interval upper bound vector of the interval value maximize,other types of indicators are marked as NA.
#'
#' @return Data set containing D+,D- and C values
#' @export AHPTopsis
#'
#' @examples
#' \donttest{
#' sampleData<-sampleData
#' MatixData<-MatixData
#' mth<-c("ZH","ZJ","QJ","ZH","FU","ZH","QJ","FU","FU","ZH")
#' zmth<-c(NA,NA,NA,NA,"CZ",NA,NA,"DS","CZ",NA)
#' xbest<-c(NA,4,NA,NA,NA,NA,NA,NA,NA,NA)
#' qup<-c(NA,NA,5,NA,NA,NA,5,NA,NA,NA)
#' qlow<-c(NA,NA,3,NA,NA,NA,3,NA,NA,NA)
#' AHPTopsis(sampleData,MatixData,mth,zmth,xbest,qlow,qup)
#' }
AHPTopsis<-function(data,matrixdata,mth,zmth,xbest,qlow,qup){
TopData<-data
matrixdata<-matrixdata
mth<-mth
zmth<-zmth
xbest<-xbest
qlow<-qlow
qup<-qup
MaxData<-data2max(data=TopData,mth,zmth,xbest,qlow,qup)
NormalData<-DataNormal(MaxData)
TopsisData<-AHPTopsisN(NormalData,matrixdata)
return(TopsisData)
}
