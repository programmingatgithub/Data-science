#a. Write an R script to find basic descriptive statistics using summary, str, quartile , Mean, Median, Mode function on mtcars & cars datasets
#b. Write an R script to find subset of dataset by using subset (), aggregate () functions on iris dataset.

# a. Descriptive statistics on mtcars & cars datasets

# Summary and structure
summary(mtcars)
str(mtcars)
summary(cars)
str(cars)

# Quartiles
quantile(mtcars$mpg)
quantile(cars$speed)

# Mean
mean_mtcars_mpg <- mean(mtcars$mpg)
mean_cars_speed <- mean(cars$speed)

# Median
median_mtcars_mpg <- median(mtcars$mpg)
median_cars_speed <- median(cars$speed)

# Mode function definition 
get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

mode_mtcars_mpg <- get_mode(mtcars$mpg)
mode_cars_speed <- get_mode(cars$speed)

# Printing the basic stats
print(paste("Mean of mtcars mpg:", mean_mtcars_mpg))
print(paste("Median of mtcars mpg:", median_mtcars_mpg))
print(paste("Mode of mtcars mpg:", mode_mtcars_mpg))
print(paste("Mean of cars speed:", mean_cars_speed))
print(paste("Median of cars speed:", median_cars_speed))
print(paste("Mode of cars speed:", mode_cars_speed))


# b. Subset datasets using subset() and aggregate() on iris dataset

# Subset: Get rows where Species is versicolor and Sepal.Length > 5.5
subset_iris <- subset(iris, Species == "versicolor" & Sepal.Length > 5.5)

# Aggregate: Average Sepal.Length by Species
agg_iris <- aggregate(Sepal.Length ~ Species, data=iris, FUN=mean)

# Print subset and aggregate data
print("Subset of iris dataset:")
print(subset_iris)
print("Aggregate of iris dataset (mean Sepal.Length by Species):")
print(agg_iris)
