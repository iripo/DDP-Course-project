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

shinyUI(fluidPage(
  
  #Application title  
  titlePanel("My Shiny App - Red Wine characteristics by quality scores"),

  sidebarLayout(

    #Sidebarpanel with controls to select: 
    # 1) the characteristics of wine that could be chosen to plot by quality score in density plots.  
    # 2) the characteristrics (variables) that could be chosen 
    #    - to explore the pairwise relations between variables
    #    - as predictors in linear model to predict Quality of wine

    sidebarPanel(
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
                       
      )),
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
                                      "alcohol"="alcohol"))
  ),
  
  #Show two plots and characteristics of the built model
  
mainPanel(
  tabsetPanel(type = "tabs", 
              tabPanel("Plot", plotOutput("Plot")), 
              tabPanel("Pairs", plotOutput("Pairs")), 
              tabPanel("Summary",h3("Summary of the Model with selected predictors"),verbatimTextOutput("summary"))
  )
)
)
))
