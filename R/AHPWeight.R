#' AHPWeight
#' Calculate weights on standardized data us the entropy method.
#' @param  matrixdata Judgment matrix data.
#'
#' @return weightResult is weight value of Index
#' @export AHPWeight
#'
#' @examples
#' \donttest{
#' matrixdata<-MatixData
#' AHPWeight(matrixdata)
#' }
AHPWeight<-function(matrixdata){

    matrixdata=matrixdata
    nc<-ncol(matrixdata)
    nr<-nrow(matrixdata)
    matrixdata2<- matrixdata[c(1:nr),c(2:nc)]
    matrixdata3<-data.matrix( matrixdata2)
    nco1 = ncol(matrixdata3)
    cj <- vector(length=nco1)
    cj <- apply(matrixdata3, 1, prod)  ##求每行连乘积
    weight1 <- cj^(1/nr)  ##开n次方(特征向量)
    weight2 <- weight1/sum(weight1) ##求权重
    names(weight2)<-names(matrixdata)[2:nc]
    weightResult<-weight2
    RI <- c(0.00, 0.00, 0.52, 0.89, 1.11, 1.25, 1.35, 1.40, 1.45, 1.49, 1.52, 1.54, 1.56, 1.58, 1.59 ,1.5943,1.6064,1.6133,1.6207,1.6292,1.6385,1.6403,1.6462,1.6497,1.6556,1.6587,1.6631,1.667,1.6693,1.6724) #随机一致性指标
    n2 <- length(weight2)

     if(n2 > 30){
       ResultCheck<-"The upper limit of the judgment matrix is 30 indicators, which exceeds the limit"
     }
    if (n2< 2){
      ResultCheck<-"The judgment matrix is less than 2 indicators and cannot be tested"
    }
    if (n2 > 2)
    {
      W <- matrix(weight2, ncol = 1)
      juzheng1 <- matrixdata3 %*% W
      juzheng2 <- as.vector(juzheng1)
      maxla <- sum(juzheng2/weight2)/n2
      CI = (maxla - n2)/(n2 - 1)
      CR = CI/RI[n2]
      names(CI)<-"CI"
      names(CR)<-"CR"
      if (CR <= 0.1){
        CheckOutput<-"Consistency check passed"
      }
      else{
        CheckOutput<-"CR>0.1,Consistency check failed"
      }
      names(CheckOutput)<-"CheckOutput"
      ResultCheck<-c(CI,CR,CheckOutput)
    }
    result<-list(weightResult,ResultCheck)
    names(result)<-c("weightResult","ResultCheck")
    return(result)
}
