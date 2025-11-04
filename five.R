# Load required libraries
install.packages("corrplot")  # Install corrplot package if not already installed
library(corrplot)

# Load iris dataset (built-in R dataset)
data(iris)

# a. Find correlation matrix (only numeric columns)
iris_numeric <- iris[, 1:4]
cor_matrix <- cor(iris_numeric)
print(cor_matrix)

# b. Plot the correlation matrix to visualize relationships
corrplot(cor_matrix, method = "circle", type = "upper", tl.cex=0.8, 
         main = "Correlation Plot of Iris Dataset")

# c. Analysis of covariance (ANOVA) on iris dataset with categorical variable Species
# Example: Analyzing Sepal.Length variance across Species groups
anova_model <- aov(Sepal.Length ~ Species, data = iris)
summary(anova_model)



#5(b)
# Load libraries
install.packages("ggplot2")
install.packages("pheatmap")
library(ggplot2)
library(pheatmap)

# a. Linear regression for mtcars dataset predicting mpg from wt and hp
data(mtcars)

# Fit linear regression model
lm_model <- lm(mpg ~ wt + hp, data = mtcars)
summary(lm_model)

# Correlation matrix heatmap for mtcars numeric variables
cor_matrix <- cor(mtcars)
pheatmap(cor_matrix, main = "Heatmap of mtcars Correlation Matrix")

# b. Linear and Logistic Regression with iris dataset

data(iris)

# Linear regression predicting Sepal.Length from Sepal.Width, Petal.Length, Petal.Width
lm_iris <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data=iris)
summary(lm_iris)

# Scatter plot showing predicted vs actual Sepal.Length
iris$predicted_sepal_length <- predict(lm_iris, newdata = iris)
ggplot(iris, aes(x=Sepal.Length, y=predicted_sepal_length)) + 
  geom_point() + 
  geom_abline(color="red") +
  ggtitle("Linear Regression: Actual vs Predicted Sepal.Length")

# Logistic Regression: classify Species using Sepal.Length and Sepal.Width
# Convert Species to binary classification: setosa vs others
iris$IsSetosa <- ifelse(iris$Species == "setosa", 1, 0)

logistic_model <- glm(IsSetosa ~ Sepal.Length + Sepal.Width, data = iris, family = "binomial")
summary(logistic_model)

# Predict probabilities on iris data
iris$predicted_prob <- predict(logistic_model, type="response")

# Plot predicted probability of setosa vs Sepal.Length colored by actual class
ggplot(iris, aes(x=Sepal.Length, y=predicted_prob, color=Species)) +
  geom_point() +
  ggtitle("Logistic Regression: Probability of Setosa by Sepal.Length")

# Predict class for selected iris data points
new_data <- data.frame(Sepal.Length = c(5.0, 6.0), Sepal.Width = c(3.5, 3.0))
new_data$predicted_setosa_prob <- predict(logistic_model, newdata=new_data, type="response")
new_data$predicted_class <- ifelse(new_data$predicted_setosa_prob > 0.5, "setosa", "other")
print(new_data)


