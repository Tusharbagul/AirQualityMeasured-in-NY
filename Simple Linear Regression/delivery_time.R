#Read Data
delivery <- read.csv('C:/Users/Tushar Bagul/Desktop/Data_Science/Assignments/simpleLinearregression/delivery_time.csv')
colnames(delivery)

#correlation matrix
cor(delivery)

#Regression model and summary
model1 <- lm(Delivery.Time~Sorting.Time, data = delivery)
summary(model1)

#New Data Frame With New Data
del_time = data.frame(Sorting.Time=c(6))

#Predict For The New Data
del = predict(model1, del_time)
del

#Predict For Weight Variable From Historical Data
pred <- predict(model1)
pred

#Prepare A New Data Frame With Pred And Error
newdata<-data.frame(delivery,pred,"Error"= delivery$Delivery.Time - pred)
newdata

#plots
plot(delivery, pch=16, col="blue")
plot(model1, pch=16, col="blue")
