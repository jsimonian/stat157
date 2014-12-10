#install.packages('stockPortfolio')
library('stockPortfolio')

Returns <- function(x) {return(getReturns('x', freq = "day")[6]$full$x)}
