#3.a.    Select and download of Two datasets from different domains
#  b.    Reading different types of data sets (.txt, .csv) from web and disk and writing in file in specific disk location.
#  c.     Reading Excel and XML data sheet in R.

# a. Reading CSV datasets from disk
white_wine <- read.csv("/Users/mayankverma/Downloads/wine+quality/winequality-white.csv", header = TRUE, sep = ";")
red_wine <- read.csv("/Users/mayankverma/Downloads/wine+quality/winequality-red.csv", header = TRUE, sep = ";")

# Display first few rows of each dataset
head(white_wine)
head(red_wine)

# Write a subset of white wine data (e.g., wines with quality > 6) to a new CSV file
subset_white <- subset(white_wine, alcohol > 6)
write.csv(subset_white, file = "white_wine_subset.csv", row.names = FALSE)

# Write a subset of red wine data (e.g., wines with quality > 6) to a new CSV file
subset_red <- subset(red_wine, alcohol > 6)
write.csv(subset_red, file = "red_wine_subset.csv", row.names = FALSE)



print("CSV files read successfully and subsets written to disk.")
