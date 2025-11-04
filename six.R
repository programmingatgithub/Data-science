#6(a)
# Install and load necessary packages
install.packages("caTools")
library(caTools)

# Load customer churn dataset (make sure the CSV is in working directory)
customer_churn <- read.csv("customer_churn.csv", header = TRUE)

# Sampling the dataset into train and test sets (70% train)
set.seed(123)
split <- sample.split(customer_churn$Churn, SplitRatio = 0.7)
train_data <- subset(customer_churn, split == TRUE)
test_data <- subset(customer_churn, split == FALSE)

# Covariance matrix (on numeric columns only)
numeric_cols <- sapply(train_data, is.numeric)
cov_matrix <- cov(train_data[, numeric_cols])

# Correlation matrix
cor_matrix <- cor(train_data[, numeric_cols])

print("Covariance Matrix:")
print(cov_matrix)
print("Correlation Matrix:")
print(cor_matrix)

# Calculate deviation between datasets (mean absolute deviation for example)
deviation <- mean(abs(colMeans(test_data[, numeric_cols]) - colMeans(train_data[, numeric_cols])))
print(paste("Mean Absolute Deviation between train and test numeric data:", deviation))

# Linear regression predicting 'tenure' based on 'MonthlyCharges' and 'TotalCharges'
lm_model <- lm(tenure ~ MonthlyCharges + TotalCharges, data = train_data)
summary(lm_model)

# Plot linear regression
plot(train_data$MonthlyCharges, train_data$tenure, main="Linear Regression on Customer Churn Dataset",
     xlab="Monthly Charges", ylab="Tenure", pch=19)
abline(lm_model, col="red")

#6(b)
# Load necessary packages
install.packages("caTools")
library(caTools)

# Import iris from web
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
iris_data <- read.csv(url, header = FALSE)
colnames(iris_data) <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")

# Convert Species to binary (e.g., setosa vs others) for logistic regression
iris_data$IsSetosa <- ifelse(iris_data$Species == "Iris-setosa", 1, 0)

# Logistic regression to predict IsSetosa using numeric variables
log_model <- glm(IsSetosa ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,
                 data = iris_data, family = binomial())
summary(log_model)

# Predict probabilities
iris_data$predicted_prob <- predict(log_model, type = "response")

# Calculate MAE and MSE on Petal.Length against predicted probabilities (not typical but per assignment)
MAE <- mean(abs(iris_data$Petal.Length - iris_data$predicted_prob))
MSE <- mean((iris_data$Petal.Length - iris_data$predicted_prob)^2)
print(paste("MAE:", MAE))
print(paste("MSE:", MSE))

# Check model fit using AIC and residual deviance
print(paste("AIC:", AIC(log_model)))
print(paste("Residual Deviance:", log_model$deviance))


#6(c)
# Required packages
install.packages(c("foreign", "MASS"))
library(foreign)
library(MASS)

# Import data from web storage (example URL, replace with actual)
admission_url <- "https://stats.idre.ucla.edu/stat/data/binary.csv"
admission_data <- read.csv(admission_url)

# Logistic regression model: admission ~ gre + gpa + rank
logit_model <- glm(admit ~ gre + gpa + factor(rank), data = admission_data, family = binomial())
summary(logit_model)

# Model fit check with residual deviance and AIC
print(paste("Residual Deviance:", logit_model$deviance))
print(paste("AIC:", AIC(logit_model)))


