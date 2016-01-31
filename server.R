# Shiny Application Project for the Developing Data Products course
#
# Iriny Nisina
# 31 January 2016
#
# The dataset is public available for research. The details are described in [Cortez et al., 2009]. 
# 
# P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis. 
# Modeling wine preferences by data mining from physicochemical properties.
# In Decision Support Systems>, Elsevier, 47(4):547-553. ISSN: 0167-9236.
# 
# Available at: [@Elsevier] http://dx.doi.org/10.1016/j.dss.2009.05.016
# [Pre-press (pdf)] http://www3.dsi.uminho.pt/pcortez/winequality09.pdf
# [bib] http://www3.dsi.uminho.pt/pcortez/dss09.bib

library(shiny)
library(lattice)
library(caret)

#Loading data and some simple manipulations with data variables format.
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
  
#Compute formula for densityplots tabpanel.  
  formula1 <- reactive({
    paste("~",input$variable, " | quality")
  })
    
#Compute two formulas for pairs plots and Summary tabpanels.
  formula3 <- reactive({
    paste(input$checkGroup,sep="+",collapse="+")
  })


formula2 <- reactive({
  if (length(input$checkGroup) > 0) {paste("as.numeric(quality)","~",formula3())}
  else {paste("as.numeric(quality)","~.")}
  })

#Generate Pairs plotwith variable chosen by answering question 
#What variables should be the predictors in linear model to predict 
#Quality of wine on the left sidepanel. 
  output$Pairs <- renderPlot({
    pairs(as.formula(formula2()), 
            data = Data,
            col="green",
            main="Scatterplot Matrices")
  })

#Generate Density plots chosen by answering question 
#Select what characteristic of wine would you like to plot by quality score? 
#characteristics by Quality score. 

output$Plot <- renderPlot({
  densityplot(as.formula(formula1()), 
              data = Data,
              col="blue",
              main="Red wine chosen characteristic by Quality score",
              sub="3-3 Scored, 4-4 Scored, 5-5 Scored, 6-6 Scored, 7-7 Scored, 8-8 Scored",    
              plot.points = FALSE, ref = TRUE)
})

#Generate Summary of the Linear Model with the predictors selected by answering question 
#What variables should be the predictors in linear model to predict 
#Quality of wine on the left sidepanel. 

  output$summary <- renderPrint({
    set.seed(12344)
    modFit <- train(as.formula(formula2()), data = Data,
    method = "lm")
    modFit
    })
  
})
