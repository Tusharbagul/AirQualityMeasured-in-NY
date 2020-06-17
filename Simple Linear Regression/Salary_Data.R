#Read Data
salary <- read.csv('C:/Users/Tushar Bagul/Desktop/Data_Science/Assignments/simpleLinearregression/Salary_Data.csv')
colnames(salary)

#correlation matrix
cor(salary)

#Regression model and summary
model1 <- lm(Salary~YearsExperience, data = salary)
summary(model1)

#New Data Frame With New Data
new_sal = data.frame(YearsExperience=c(6))

#Predict For The New Data
sal = predict(model1, new_sal)
sal

#Predict For Weight Variable From Historical Data
pred <- predict(model1)
pred

#Prepare A New Data Frame With Pred And Error
newdata<-data.frame(salary,pred,"Error"= salary$Salary - pred)
newdata

#Transforming input exponentially
model2 <- lm(Salary~YearsExperience + I(YearsExperience^2), data=salary)
summary(model2)

#predicting using model2
pred2 <-predict(model2)
pred2

#Prepare new df with pred2 and error
newdata2 <- data.frame(salary, pred2, "Error"=salary$Salary- pred2)
newdata2
plot(model2, pch=16, col="red")

#plots
plot(salary, pch=16, col="blue")
abline(model1)