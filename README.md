# DDP-Course-project

Here is my Shiny application written in R.  

This dataset is public available for research. The details are described in [Cortez et al., 2009]. 

  P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis. 
  Modeling wine preferences by data mining from physicochemical properties.
  In Decision Support Systems>, Elsevier, 47(4):547-553. ISSN: 0167-9236.

  Available at: [@Elsevier] http://dx.doi.org/10.1016/j.dss.2009.05.016
                [Pre-press (pdf)] http://www3.dsi.uminho.pt/pcortez/winequality09.pdf
                [bib] http://www3.dsi.uminho.pt/pcortez/dss09.bib

There are three tabpanels in this project.  

The Plot tab shows densityplots Red wine characteristic chosen by answering the question "Select what characteristic of wine would you like to plot by quality score?" on the left sidepanel by Quality score.

Through Pairs tab you could explore the pairwise relations between variables chosen by answering question What variables should be the predictors in linear model to predict Quality of wine on the left sidepanel. There are Scatterplot Matrices.

And the Summary tab shows Summary of the Linear Regression Model with selected predictors chosen by answering question What variables should be the predictors in linear model to predict Quality of wine on the left sidepanel. The model use 'lm' method.
