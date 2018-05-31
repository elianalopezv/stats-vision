library(shiny)
library(shinymaterial)
library(datasets)
library(gbm)

modcf <- readRDS("./modeloTAE.rds")

probfunction <- function(k){
  pred.boost<-predict(modcf, newdata=k,
                      n.trees=5000,
                      type="response")
}