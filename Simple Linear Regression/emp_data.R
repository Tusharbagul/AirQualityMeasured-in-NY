#Read Data
emp <- read.csv('C:/Users/Tushar Bagul/Desktop/Data_Science/Assignments/simpleLinearregression/emp_data.csv')
colnames(emp)

#correlation matrix
cor(emp)

#Regression model and summary
model1 <- lm(Churn_out_rate~Salary_hike, data = emp)
summary(model1)

#New Data Frame With New Data
churn_rate = data.frame(Salary_hike=c(1600))

#Predict For The New Data
churn = predict(model1, churn_rate)
churn

#Predict For Weight Variable From Historical Data
pred <- predict(model1)
pred

#Prepare A New Data Frame With Pred And Error
newdata<-data.frame(emp,pred,"Error"= emp$Churn_out_rate - pred)
newdata

#Transforming input exponentially
model2 <- lm(Churn_out_rate~Salary_hike + I(Salary_hike^2), data=emp)
summary(model2)

#predicting using model2
pred2 <-predict(model2)
pred2

#Prepare new df with pred2 and error
newdata2 <- data.frame(emp, pred2, "Error"=emp$Churn_out_rate - pred2)
newdata2

#plots
plot(emp, pch=16, col="blue")
plot(model2, pch=16, col="blue")
