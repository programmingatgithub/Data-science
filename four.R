#4.a.    Find the data distributions using box and scatter plot.
#  b.  Find the outliers using plot.
#  c.  Plot the histogram, bar chart and pie chart on sample data


# Load necessary libraries
library(ggplot2)
library(readxl)  # for Excel reading example
library(XML)     # for XML reading example

setwd("/Users/mayankverma/Downloads/wine+quality")  

white_wine <- read.csv("/Users/mayankverma/Downloads/wine+quality/winequality-white.csv", sep = ";", header = TRUE)
red_wine <- read.csv("/Users/mayankverma/Downloads/wine+quality/winequality-red.csv", sep = ";", header = TRUE)

names(white_wine) <- trimws(names(white_wine))
names(red_wine) <- trimws(names(red_wine))

print(colnames(white_wine))
print(colnames(red_wine))

# a. Data Distributions using boxplot and scatter plot

# Box plot of 'alcohol' for white wine
ggplot(white_wine, aes(y = alcohol)) +
  geom_boxplot(fill = "lightblue") +
  ggtitle("Box Plot of Alcohol in White Wine")

# Scatter plot of alcohol vs quality for red wine
ggplot(red_wine, aes(x = alcohol, y = quality)) +
  geom_point(color = "red", alpha = 0.5) +
  ggtitle("Scatter Plot of Alcohol vs Quality (Red Wine)")

# b. Identify outliers using boxplots for 'pH' in both datasets

ggplot(white_wine, aes(y = pH)) +
  geom_boxplot(fill = "lightgreen") +
  ggtitle("Box Plot of pH (White Wine) - Outlier Detection")

ggplot(red_wine, aes(y = pH)) +
  geom_boxplot(fill = "pink") +
  ggtitle("Box Plot of pH (Red Wine) - Outlier Detection")

# c. Histogram, bar chart and pie chart

# Histogram of 'residual sugar' in white wine
ggplot(white_wine, aes(x = residual.sugar)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  ggtitle("Histogram of Residual Sugar (White Wine)")

# Bar chart of 'quality' counts in red wine
ggplot(red_wine, aes(x = factor(quality))) +
  geom_bar(fill = "darkred") +
  xlab("Quality") +
  ggtitle("Bar Chart of Wine Quality (Red Wine)")

# Pie chart of quality distribution in white wine
quality_counts <- table(white_wine$quality)
pie(quality_counts, labels = names(quality_counts), col = rainbow(length(quality_counts)),
    main = "Pie Chart of Wine Quality (White Wine)")




