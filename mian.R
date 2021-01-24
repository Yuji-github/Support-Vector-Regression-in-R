# SVR 
# install.packages(caTools)
# install.packages(ggplot2)
# install.packages(e1071)

library(caTools)
library(ggplot2)
library(e1071) # for SVR

# import data 
data = read.csv('Position_Salaries.csv')

# remove unnecessary features from data
data = data[2:3]

# checking data trend 
ggplot()+
  geom_point(aes(x=data$Level, y=data$Salary), color='red')+
  xlab('Level')+
  ylab('Salaey')

# splitting data into 
# set.seed(123)
# split = sample.split(data$Salary, SplitRatio = 2/3) #split(y, splitratio)
# train = subset(data, split == TRUE)
# test = subset(data, split == FALSE)

# feature scaling 
# train = scale(train)
# test = scale(test)

# training data with SVR model library(e1071)
# svm(formula, data, TYPE, kernel(default = 'rbf'))
# type = 'eps-regression' specifying type as non-linear regression
svr_leg = svm(formula=Salary ~ ., data = data, 
              type='eps-regression')
summary(svr_leg)

# prediction 
y_pred = predict(svr_leg, newdata = data)
y_pred_six = predict(svr_leg, data.frame(Level = 6.5))

# plotting the results
ggplot() +
  geom_point(aes(x = data$Level, y = data$Salary), 
             color = 'red') +
  geom_line(aes(x = data$Level, y = predict(svr_leg, newdata = data)), 
            color = 'blue') +
  ggtitle('Salary vs Level (Support Vector Regression)') + 
  xlab('Level') + 
  ylab('Salary')