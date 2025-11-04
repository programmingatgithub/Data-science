# Install if not present
if(!require(caret)) install.packages("caret", dependencies=TRUE)
if(!require(rpart)) install.packages("rpart")
if(!require(rpart.plot)) install.packages("rpart.plot")
if(!require(e1071)) install.packages("e1071")  # for confusionMatrix

library(caret)
library(rpart)
library(rpart.plot)
library(e1071)


# Load data
wine <- read.csv("/Users/mayankverma/Downloads/wine+quality/winequality-white.csv", sep=";")
wine$good <- as.factor(ifelse(wine$quality >= 7, "yes", "no"))  # Binary target

set.seed(42)
train_idx <- createDataPartition(wine$good, p=0.7, list=FALSE)
train <- wine[train_idx, ]
test <- wine[-train_idx, ]

# Decision tree
tree_mod <- rpart(good ~ . -quality, data=train, method="class")
rpart.plot(tree_mod, main="Decision Tree for Good Wine")

# Predict
pred <- predict(tree_mod, test, type="class")




cm <- confusionMatrix(pred, test$good, positive="yes")

# Output key metrics
cm$overall["Accuracy"]
cm$byClass["Precision"]
cm$byClass["Recall"]
cm$byClass["F1"]



# Use only two features for boundary visualization: alcohol & sulphates
library(ggplot2)
# Retrain tree on two features
tree2 <- rpart(good ~ alcohol + sulphates, data=train, method="class")
grid <- expand.grid(
  alcohol = seq(min(wine$alcohol), max(wine$alcohol), length=150),
  sulphates = seq(min(wine$sulphates), max(wine$sulphates), length=150)
)
grid$good <- predict(tree2, newdata=grid, type="class")

ggplot() +
  geom_point(data=test, aes(x=alcohol, y=sulphates, color=good), alpha=0.5) +
  geom_tile(data=grid, aes(x=alcohol, y=sulphates, fill=good), alpha=0.2) +
  ggtitle("Decision Tree Classifier Boundaries") +
  theme_minimal()

