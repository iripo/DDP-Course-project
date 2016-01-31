library(shiny)

#P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis. Modeling wine preferences by data mining from physicochemical properties. In Decision Support Systems, Elsevier, 47(4):547-553, 2009. 
shinyUI(fluidPage(
  titlePanel("My Shiny App - Red Wine characteristics by quality scores"),
  sidebarLayout(
    sidebarPanel(
    checkboxGroupInput("checkGroup", 
                   label = h3("What variables should be the predictors in linear model to predict Quality of wine"), 
                   choices = list("fixed acidity" = "fixed.acidity", 
                   "volatile acidity" = "volatile.acidity", 
                   "citric acid" = "citric.acid",
                   "residual sugar"="residual.sugar",
                   "chlorides"="chlorides",
                   "free sulfur dioxide" = "free.sulfur.dioxide",
                   "total sulfur dioxide"="total.sulfur.dioxide",
                   "density"="density",
                   "pH"="pH",
                   "sulphates"="sulphates",
                   "alcohol"="alcohol")), 
    selectInput("variable", "Select what characteristic of wine would you like to plot by quality score?",
                  list("fixed acidity" = "fixed.acidity", 
                       "volatile acidity" = "volatile.acidity", 
                       "citric acid" = "citric.acid",
                       "residual sugar"="residual.sugar",
                       "chlorides"="chlorides",
                       "free sulfur dioxide" = "free.sulfur.dioxide",
                       "total sulfur dioxide"="total.sulfur.dioxide",
                       "density"="density",
                       "pH"="pH",
                       "sulphates"="sulphates",
                       "alcohol"="alcohol"                       
                       
      ))
    ),  
mainPanel(
  tabsetPanel(type = "tabs", 
              tabPanel("Plot", plotOutput("Plot")), 
              tabPanel("Pairs", plotOutput("Pairs")), 
              tabPanel("Summary",h3("Summary of the Model with selected predictors"),verbatimTextOutput("summary"))
  )
)
)
))
