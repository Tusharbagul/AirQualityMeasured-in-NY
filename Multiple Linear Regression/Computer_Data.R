library(car)
computer <- read.csv("C:/Users/Tushar Bagul/Desktop/Data_Science/Assignments/Multiple_Linear_Regression/Computer_Data.csv")
colnames(computer)
computer

#removing cd, multi, premium column
comp <- computer[1:6259, c(2:6,10,11)]
View(comp)
colnames(comp)
pairs(comp)
cor(comp)
install.packages("olsrr")
library(olsrr)
library(MASS)

#Model
price <- lm(price ~ ., 
            data = comp)
summary(price)
qqPlot(price)
influenceIndexPlot(price)
residualPlots(price)
plot(price)
avPlot(price)

#Model 2 with log transformation
price2 <- lm(price ~ speed+hd+log(hd)+log(ram)+screen+ads+trend, 
             data = comp)
summary(price2)
qqPlot(price2)
residualPlots(price2)
influenceIndexPlot(price2)
ols_plot_cooksd_bar(price2)
ols_plot_resid_lev(price2)

#Model 3 with removal of outlier
price3 <- lm(price ~ speed+hd+log(hd)+ram+log(ram)+screen+ads+trend, 
             data = comp[-c(1992,2097,3784),])
summary(price3)
influenceIndexPlot(price3)
residualPlots(price3)

#Model 4 with removal of outlier and using square transformation
price4 <- lm(price ~ speed+hd+I(hd^2)+ram+I(ram^2)+screen+ads+trend, 
             data = comp[-c(1992,2097,3784,1701,1507,1441,5961,4478,4074),])
summary(price4)
influenceIndexPlot(price4)
residualPlots(price4)
qqPlot(price4)
car::vif(price4)

#Predict on new data
testdata <- data.frame(speed=60, 
                       hd=250, ram=4, screen=15, ads=94, trend=2)
predict(price4, testdata)