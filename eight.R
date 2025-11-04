# Load data
wine <- read.csv("/Users/mayankverma/Downloads/wine+quality/winequality-white.csv", sep=";")

# Accuracy for regression: R² metric, use multiple regression
mod <- lm(quality ~ ., data=wine)
summary(mod)$r.squared  # Regression "accuracy"

# Mean, Median, Mode for a predictor (e.g., alcohol)
mean(wine$alcohol)
median(wine$alcohol)
# Mode function (as R has no native mode)
mode_func <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
mode_func(wine$alcohol)

# Interquartile range (IQR)
IQR(wine$alcohol)



wine$good <- ifelse(wine$quality >= 7, 1, 0)  # Binary target
set.seed(1)
train_idx <- sample(seq_len(nrow(wine)), size = 0.7*nrow(wine))
train <- wine[train_idx, ]
test <- wine[-train_idx, ]

# Logistic Regression
logit <- glm(good ~ .-quality, data=train, family=binomial)
prob <- predict(logit, newdata=test, type="response")
pred <- as.integer(prob > 0.5)

# Confusion Matrix, Precision, Recall
table(pred, test$good)
precision <- sum(pred == 1 & test$good == 1) / sum(pred == 1)
recall <- sum(pred == 1 & test$good == 1) / sum(test$good == 1)
precision
recall

# Install if not present
if(!require(entropy)) install.packages("entropy")
library(entropy)

# Entropy for wine quality (as classification example)
p <- prop.table(table(wine$good))
entropy_value <- -sum(p * log2(p))
entropy_value

# Information gain: e.g., for 'alcohol'
library(FSelector)
info.gain(factor(good) ~ alcohol, data=wine)


