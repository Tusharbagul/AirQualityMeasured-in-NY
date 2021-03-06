#####Support Vector Machines -------------------
##  Optical Character Recognition ----
letterdata<-read.csv("C:/Users/Tushar Bagul/Desktop/Data_Science/RCodes_weekend_DS/letterdata.csv")

# divide into training and test data
letterdata$letter <- as.factor(letterdata$letter)
#library(caret) for data partition
#createDataPartition()
letters_train <- letterdata[1:16000, ]
letters_test  <- letterdata[16001:20000, ]

##Training a model on the data ----
# begin by training a simple linear SVM
install.packages("kernlab")
library(kernlab)
letter_classifier <- ksvm(letter ~ ., data = letters_train,
                          kernel = "vanilladot")

## Evaluating model performance ----
# predictions on testing dataset
letter_predictions <- predict(letter_classifier, letters_test)
head(letter_predictions)

#table(letter_predictions, letters_test$letter)
agreement <- letter_predictions == letters_test$letter
prop.table(table(agreement))

## Improving model performance ----
letter_classifier_rbf <- ksvm(letter ~ ., data = letters_train, kernel = "rbfdot")
letter_predictions_rbf <- predict(letter_classifier_rbf, letters_test)
head(letter_predictions_rbf)
agreement_rbf <- letter_predictions_rbf == letters_test$letter
table(agreement_rbf)
prop.table(table(agreement_rbf))