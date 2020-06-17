#Read Data
calories <- read.csv('C:/Users/Tushar Bagul/Desktop/Data_Science/Assignments/simpleLinearregression/calories_consumed.csv')
colnames(calories)

#correlation matrix
cor(calories)

#Regression model and summary
model1 <- lm(Weight.gained..grams.~Calories.Consumed, data = calories)
summary(model1)

#New Data Frame With New Data
new_weight = data.frame(Calories.Consumed=c(1500))

#Predict For The New Data
weight = predict(model1, new_weight)
weight

#Predict For Weight Variable From Historical Data
pred <- predict(model1)
pred

#Prepare A New Data Frame With Pred And Error
newdata<-data.frame(calories,pred,"Error"= calories$Weight.gained..grams. -pred)
newdata

#Transforming input exponentially
model2 <- lm(Weight.gained..grams.~Calories.Consumed + I(Calories.Consumed^2), data=calories)
summary(model2)

#predicting using model2
pred2 <-predict(model2)
pred2

#Prepare new df with pred2 and error
newdata2 <- data.frame(calories, pred2, "Error"=calories$Weight.gained..grams.-pred2)
newdata2

#plots
plot(calories, pch=16, col="blue")
plot(model1, pch=16, col="blue")