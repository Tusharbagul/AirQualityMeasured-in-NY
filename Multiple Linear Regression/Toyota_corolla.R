install.packages("readxl") 
library("readxl")
library(car)
toyota<-read_excel("C:/Users/Tushar Bagul/Desktop/Data_Science/Toyota.xlsx")
colSums(is.na(toyota))
toyota_new<-na.omit(toyota)
colnames(toyota_new)
toyota_new<-toyota_new[,c(3,4,7,9,16,13,14,17,18)]
#toyota_new<-subset(toyota_new, select = c("Price","CC"))
#Scatter_Plot
pairs(toyota_new)
#correlation
cor(toyota_new)
#Regression Model nd Summary
model.car<-lm(Price~.,data = toyota_new)
summary(model.car)
plot(model.car)

#Multi-Colinearity
library(car)
car::vif(model.car)

#Residuals vs Regressors
residualPlots(model.car)
#Addes Variable Plots
avPlots(model.car)
#QQ Plots of standardized residuals
qqPlot(model.car)
#Deletion Dignostics
influenceIndexPlot(model.car)
####Iteration 1 
#Remove 79th observation
toyota['Age2']<-toyota$Age_08_04*toyota$Age_08_04
toyota1<-toyota[-c(79),]
model.car1<-lm(Price~.,data = toyota1)
summary(model.car1)
plot(model.car1)
residualPlots(model.car1)
qqPlot(model.car1)
influenceIndexPlot(model.car1)

########
toyota2<-toyota_new[-c(79,219),]

model.car2<-lm(Price~.,data = toyota2)
summary(model.car2)
qqPlot(model.car2)
influenceIndexPlot(model.car2)

###Final
model.car2<-lm(Price~.,data = toyota_new[-c(950,79,600,220,219,218,520,957,217,518),-c(7)])
summary(model.car2)
qqPlot(model.car2)
influenceIndexPlot(model.car2)

##Predict for new data
testdata<-data.frame(Age_08_04=20,KM =2000,HP =90,Gears =40,cc=1500,
                     Quarterly_Tax=200,Weight=1500,Age2=400)

predict(model.car2,testdata)