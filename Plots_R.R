datasets::airquality
airquality <- datasets::airquality

# Top 10 rows and last 10 rows
head(airquality, 10)
tail(airquality,10)

#columns
airquality[, c(1,2)]
airquality$Wind

####Summary of Data
summary(airquality$Temp)
summary(airquality)
summary(airquality$Wind)

###Plots
plot(airquality$Wind)
plot(airquality$Temp, airquality$Wind)
plot(airquality$Wind, type="b") # p:point, l:lines, b:both
plot(airquality$Wind, xlab = 'ozone Concentration', 
     ylab = 'No of Instances', main = 'Ozone levels in NY city',
     col = 'red')
#horizontal bar plot
barplot(airquality$Ozone, main = 'Ozone Concenteration in air',
        ylab = 'Wind levels', col= 'red',horiz = F)

#histogram
hist(airquality$Ozone[1:10, 4])
hist(airquality$Ozone[1:10,4], main = 'Ozone values in air',
     xlab = 'Ozone', col='red')

#single Box plot
boxplot(airquality$Wind, main="Boxplot")
#multiple box plots
boxplot(airquality[,1:4],main='Multiple')

#margin of the grid(mar), 
#no of rows and columns(mfrow), 
#whether a border is to be included(bty) 
#and position of the 
#labels(las: 1 for horizontal, las: 0 for vertical)
#bty - box around the plot

par(mfrow=c(3,3),mar=c(2,5,2,1),  las=0, bty="n")

plot(airquality$Ozone)
plot(airquality$Ozone, airquality$Wind)
plot(airquality$Ozone, type= "l")
plot(airquality$Ozone, type= "l")
plot(airquality$Ozone, type= "l")
barplot(airquality$Ozone, main = 'Ozone Concenteration in air',
        xlab = 'ozone levels', col='green',horiz = FALSE)
hist(airquality$Solar.R)
boxplot(airquality$Solar.R)
boxplot(airquality[,0:4], main='Multiple Box plots')