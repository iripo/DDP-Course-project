library(shiny)
library(lattice)
library(caret)


Data <- read.csv2("./data/winequality-red.csv")
Data$fixed.acidity <- as.numeric(as.character(Data$fixed.acidity))
Data$volatile.acidity <- as.numeric(as.character(Data$volatile.acidity))
Data$citric.acid <- as.numeric(as.character(Data$citric.acid))
Data$residual.sugar <- as.numeric(as.character(Data$residual.sugar))
Data$chlorides <- as.numeric(as.character(Data$chlorides))
Data$free.sulfur.dioxide <- as.numeric(as.character(Data$free.sulfur.dioxide))
Data$total.sulfur.dioxide <- as.numeric(as.character(Data$total.sulfur.dioxide))
Data$density <- as.numeric(as.character(Data$density))
Data$pH <- as.numeric(as.character(Data$pH))
Data$sulphates <- as.numeric(as.character(Data$sulphates))
Data$alcohol <- as.numeric(as.character(Data$alcohol))
Data$quality <- as.factor(Data$quality)

shinyServer(function(input, output) {
  
  formula1 <- reactive({
    paste("~",input$variable, " | quality")
  })
    
  output$caption <- renderText({
    formula1()
  })

  formula3 <- reactive({
    paste(input$checkGroup,sep="+",collapse="+")
  })
  
  output$caption <- renderText({
    formula3()
  })

formula2 <- reactive({
  if (length(input$checkGroup) > 0) {paste("as.numeric(quality)","~",formula3())}
  else {paste("as.numeric(quality)","~.")}
  })
  output$caption <- renderText({
    formula2()
  })
  
  output$Pairs <- renderPlot({
    pairs(as.formula(formula2()), 
            data = Data,
            col="green",
            main="Scatterplot Matrices")
  })
  
output$Plot <- renderPlot({
  densityplot(as.formula(formula1()), 
              data = Data,
              col="blue",
              main="Red wine chosen characteristic by Quality score",
              sub="3-3 Scored, 4-4 Scored, 5-5 Scored, 6-6 Scored, 7-7 Scored, 8-8 Scored",    
              plot.points = FALSE, ref = TRUE)
})
  output$summary <- renderPrint({
    set.seed(12344)
    modFit <- train(as.formula(formula2()), data = Data,
    method = "lm")
    modFit
    })
  
})
