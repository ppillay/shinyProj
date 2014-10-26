# server.R
source("helpers.R")
data(iris)
library(randomForest)
library(ggplot2)
set.seed(111)
iris.rf <- randomForest(Species ~ ., data=iris)

shinyServer(
  function(input, output) {
    data <- reactive({
      args <- switch(input$var,
                     "Sepal Length" = list(iris$Sepal.Length,"Sepal Length"),
                     "Sepal Width" = list(iris$Sepal.Width,"Sepal Width"),
                     "Petal Length" = list(iris$Petal.Length,"Petal Length"),
                     "Petal Width" = list(iris$Petal.Width,"Petal Width"))
    })
    
    predictors <- reactive({
      vars <- data.frame(Sepal.Length=input$slen,Sepal.Width=input$swid,Petal.Length=input$plen,Petal.Width=input$pwid)
    })
    
    output$histo <- renderPlot({      
      do.call(histo,data())
    })

    output$summary <- renderPrint({
      do.call(summo,data())
    })
    
    output$prediction <- renderPrint({
      values <- list(iris.rf,predictors())
      do.call(predicto,values)
    })

    output$plot1 <- renderPlot({
      par(mar = c(5.1, 4.1, 0, 1))
      qplot(data=iris,Sepal.Length,Sepal.Width,ylab="Sepal Width",xlab="Sepal Length",colour=Species,size=5) + scale_size(guide="none")
    })
    output$plot2 <- renderPlot({
      par(mar = c(5.1, 4.1, 0, 1))
      qplot(data=iris,Petal.Length,Petal.Width,ylab="Petal Width",xlab="Petal Length",colour=Species,size=5) + scale_size(guide="none")
    })    
  }
  
)