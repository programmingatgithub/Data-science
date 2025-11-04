# Direct calculation on console without objects
5 + 3
10 * 2
sqrt(16)
log(10)


# Using R objects on console
a <- 5
b <- 3
sum <- a + b
product <- a * b
square_root <- sqrt(a)
logarithm <- log(b)
sum
product
square_root
logarithm



# Mathematical functions examples on console
abs(-15)        
factorial(5)    
ceil <- ceiling(4.7)  
floor_val <- floor(4.7)  
round_val <- round(4.678, digits=2)  
sin_val <- sin(pi / 2)  
cos_val <- cos(0)      

abs(-15)
factorial(5)
ceil
floor_val
round_val
sin_val
cos_val

# Create R objects for calculator application
num1 <- 15
num2 <- 4

addition <- num1 + num2
subtraction <- num1 - num2
multiplication <- num1 * num2
division <- num1 / num2
power <- num1^num2
modulus <- num1 %% num2

file_path <- "~/Desktop/calculator_output.RData"
save(num1, num2, addition, subtraction, multiplication, division, power, modulus, file = file_path)

# Print to verify
print(paste("Addition:", addition))
print(paste("Subtraction:", subtraction))
print(paste("Multiplication:", multiplication))
print(paste("Division:", division))
print(paste("Power:", power))
print(paste("Modulus:", modulus))


