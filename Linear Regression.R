##LINEAR REGRESSION IN R STHDA.COM

#The simple linear regression is used to predict a quantitative outcome
#y on the basis of one single predictor variable x. 
#The goal is to build a mathematical model (or formula) that defines y 
#as a function of the x variable.

#Once, we built a statistically significant model, 
#it's possible to use it for predicting future outcome on the basis of 
#new x values.

#Consider that, we want to evaluate the impact of advertising budgets
#of three medias (youtube, facebook and newspaper) on future sales. 
#This example of problem can be modeled with linear regression.

# The mathematical formula of the linear regression can be written as 
# y = b0 + b1*x + e, where:
  
#  b0 and b1 are known as the regression beta coefficients or parameters:
#  b0 is the intercept of the regression line; that is the predicted value when x=0
#  b1 is the slope of the regression line.
#  e is the error term (also known as the residual errors)

#Packages
library(tidyverse)
install.packages("ggpubr")
library(ggpubr)
install.packages("devtools")
library(devtools)

#We'll use the marketing data set [datarium package]. 
#It contains the impact of three advertising medias 
#(youtube, facebook and newspaper) on sales. 
#Data are the advertising budget in thousands of dollars along with the sales. 
#The advertising experiment has been repeated
#200 times with different budgets and the observed sales have been recorded

devtools::install_github("kassambara/datarium")
data("marketing", package = "datarium")
view(marketing)

#predict future sales on the basis of advertising budget spent on youtube.

ggplot(marketing, aes(youtube, sales))+
  geom_point()+
  stat_smooth()
#linearly increasing relationship btw sales and youtube variables.

#Find correlation cofficient btw these two

cor(marketing$sales, marketing$youtube)
#correlation cofficient measures level of association btw variables(x,y)
#The linear model equation can be written as follow: sales = b0 + b1 * youtube

model <- lm(sales~youtube, data = marketing)
model

ggplot(marketing, aes(youtube, sales))+
  geom_point()+
  stat_smooth(method = lm)

# Quality of model
summary(model)

confint(model)



