library(car)
library(MASS)
install.packages("psych")
library(psych)
install.packages("corpcor")
library(corpcor)
library(olsrr)

#reading data
startup_50 <- read.csv("C:/Users/Tushar Bagul/Desktop/Data_Science/Assignments/Multiple_Linear_Regression/50_Startups.csv")
colnames(startup_50)
pairs.panels(startup_50)

#dropping state
startup <- startup_50[-c(4)]
View(startup)

#some graphs
pairs(startup)
cor(startup)
cor2pcor(cor(startup))

#Iterartion-1 model
profit <- lm(Profit ~ ., 
             data = startup)
summary(profit)
qqPlot(profit)
influenceIndexPlot(profit)
residualPlots(profit)
influencePlot(profit)

#Iteration-2 model
profit2 <- lm(Profit ~ ., 
              data = startup[-c(49,50),])
summary(profit2)
influenceIndexPlot(profit2)
qqPlot(profit2)
residualPlots(profit2)
residualPlot(profit2)

#VIF and AIC
vif(profit)
vif(profit2)
stepAIC(profit)
stepAIC(profit2)

#Iteration 3 Model
profit3 <- lm(Profit ~ R.D.Spend + Marketing.Spend, 
              data = startup[-c(49,50),])
summary(profit3)
influenceIndexPlot(profit3)
qqPlot(profit3)
residualPlot(profit3)

#Iteration 4 Model
profit4 <- lm(Profit ~ R.D.Spend + Marketing.Spend,
              data = startup[-c(49,50,47,46),])
summary(profit4)
influenceIndexPlot(profit4)
qqPlot(profit4)
ols_plot_cooksd_bar(profit4)
ols_plot_resid_lev(profit4)


testdata <- data.frame(R.D.Spend=165349.20, 
                       Marketing.Spend=	471784.10)
predict(profit4, testdata)
