# Load dataset
white_wine <- read.csv("/Users/mayankverma/Downloads/wine+quality/winequality-white.csv", sep = ";", header = TRUE)

# View structure and summary
str(white_wine)
summary(white_wine)

# 1) Multiple linear regression: Predict quality using all other numeric variables
# Drop non-numeric columns (if any)
numeric_cols <- sapply(white_wine, is.numeric)
data_num <- white_wine[, numeric_cols]
model <- lm(quality ~ ., data = data_num)
summary(model)

# Interpret coefficients and correlation between variables
cor_matrix <- cor(data_num)
print("Correlation matrix:")
print(cor_matrix)

# 2) Check underfitting or overfitting using Residual standard error and Adjusted R-squared
cat("Adjusted R-squared:", summary(model)$adj.r.squared, "\n")
cat("Residual Standard Error:", summary(model)$sigma, "\n")

# 3) Model accuracy using Mean Absolute Error and Root Mean Squared Error on training data
predicted <- predict(model, data_num)
actual <- data_num$quality
MAE <- mean(abs(actual - predicted))
RMSE <- sqrt(mean((actual - predicted)^2))
cat("Mean Absolute Error (MAE):", MAE, "\n")
cat("Root Mean Squared Error (RMSE):", RMSE, "\n")

# Plot residuals to visualize model fit
plot(model$residuals, main = "Residuals Plot", ylab = "Residuals", xlab = "Index")
abline(h = 0, col = "red")
