
histo <- function(var, xlabel) {
  hist(as.vector(unlist(var)),xlab=xlabel,main=paste("Histogram of",xlabel))
}

summo <- function(var, label) {
  summary(as.vector(unlist(var)))
}

predicto <- function(model, predictors) {
  pick <- predict(model, predictors)
  cat(paste("Model prediction for selected parameters: ",as.character(pick)))
}