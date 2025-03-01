highway = read.csv("highway.csv")

## Best Subsets selection

library(leaps)
best_subset = regsubsets(Rate~., data = highway, nvmax = 13)
summary(best_subset)

reg.summary = summary(best_subset)
reg.summary$adjr2
plot(reg.summary$adjr2, xlab="Number of Variables", ylab="Adjusted R Squared", type="b", col="blue", pch=15)


coef(best_subset, 5)
fit.best=lm(Rate~Len+Slim+Sigs+Acpt+Pa, data = highway)
summary(fit.best)

## Ridge Regression
library(glmnet)
x = model.matrix(Rate~., data = highway)[,-1]
y = highway$Rate

set.seed(42)
ridge_model = cv.glmnet(x,y,alpha = 0)
plot(ridge_model)

bestlamda_ridge = ridge_model$lamba.min
bestlamda_ridge

log(bestlamda_ridge)

predict(ridge_model, type= "coefficients", S = bestlamda_ridge)[1:13,]

ridge_fit = lm(Rate~., data = highway)
summary(ridge_fit)

## Lasso
set.seed(42)
lasso_model = cv.glmnet(x,y, alpha=1)
plot(lasso_model)

bestlamda_lasso = lasso_model$lambda.min
bestlamda_lasso

predict(lasso_model, type="coefficient",s=bestlamda_lasso)[1:13,]

## 5 features selected Len, Trks, Sigs, Acpt, Slim

lasso_fit = lm(Rate~Len+Trks+Slim+Sigs+Acpt, data = highway)
## Only put the features selected in the linear model
summary(lasso_fit)

## CV for MSE
library(boot)
set.seed(42)
ridge = glm(Rate~., data = highway)
cv.mse.ridge = cv.glm(highway, ridge, K=10)$delta[1]
## 3.802

set.seed(42)
lasso = glm(Rate~Len+Trks+Slim+Sigs+Acpt, data = highway)
cv.mse.lasso = cv.glm(highway, lasso, K=10)$delta[1]
## 1.708

## Problem 2


# Read the dataset
gas <- read.csv("gasconsumption.csv")

# Set up the plotting area to display 3 plots in one window
par(mfrow = c(1, 3))

# Scatter plot of GPM vs WT
plot(gas$WT, gas$GPM, 
     main = "GPM vs WT", 
     xlab = "Weight (WT in 1000 lbs)", 
     ylab = "Gas Consumption (GPM)", 
     pch = 19, col = "blue")
abline(lm(GPM ~ WT, data = gas), col = "red")  # Add regression line

# Scatter plot of GPM vs DIS
plot(gas$DIS, gas$GPM, 
     main = "GPM vs DIS", 
     xlab = "Engine Displacement (DIS in cubic inches)", 
     ylab = "Gas Consumption (GPM)", 
     pch = 19, col = "blue")
abline(lm(GPM ~ DIS, data = gas), col = "red")  # Add regression line

# Scatter plot of GPM vs NC
plot(gas$NC, gas$GPM, 
     main = "GPM vs NC", 
     xlab = "Number of Cylinders (NC)", 
     ylab = "Gas Consumption (GPM)", 
     pch = 19, col = "blue")
abline(lm(GPM ~ NC, data = gas), col = "red")  # Add regression line

# Reset the plotting layout
par(mfrow = c(1, 1))




gas = read.csv("gasconsumption.csv")

fit1 = lm(GPM~., data = gas)
summary(fit1)

# Read the dataset
gas <- read.csv("gasconsumption.csv")

# Fit multiple linear regression model
model <- lm(GPM ~ WT + DIS + NC, data = gas)

# Print summary of the model
summary(model)


#the dot next to NC means it is not signifcant at 5% but is is signifcant at 10%
#reject the null hypothesis that all 3 variables are = to 0

library(boot)

boot_function = function(data, index) {
  model1 = lm(GPM~., data = data, subset = index)
  return(coef(model1)["NC"])
}

boot_output = boot(gas, boot_function, R=5000)
hist(boot_output$t,50)
sd(boot_output$t)

c(quantile(boot_output$t,0.05),quantile(boot_output$t,0.95))

c(quantile(boot_output$t,0.025),quantile(boot_output$t,0.975))
#beta 3 is not significant at 

