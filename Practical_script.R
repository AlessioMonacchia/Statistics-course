# This is a comment
print("Hello World!")

# Variable assignment
x <- 42
my_numeric <- 42
my_character <- "universe"
my_logical <- FALSE

class(my_numeric)
class(my_character)
class(my_logical)

# Function
function_name <- function(arg_1, arg_2,...)
  function body()
}

# Atomic Vectors, the most basic data type in R. 1-dimensional, homogeneous
my_logical_vector <- c(T, F, TRUE)
my_logical_vector
my_character_vector <- c("some", "random", "words")
my_character_vector
my_numeric_vector <- c(1, 2, 3)
my_numeric_vector
1:3
seq(1, 3, by = 1)
names(my_numeric_vector) <- c("one", "two", "three")
my_numeric_vector
typeof(my_numeric_vector)
length(my_numeric_vector)
rm(my_numeric_vector)
ls()
class(my_character_vector)
rep(my_character_vector)

vec <- 1:5
vec[2:4]                        # Indexing vectors
vec[c(-2,-3, -4)]
vec[-(2:4)]
vec[c(T, F, F, F, T)]
vec[vec < 4]
names(vec) <- c("one", "two", "three", "four", "five")
vec[c("five", "three")]

# MATRICES: 2D data structure, similar to vectors but additionally contains the dimension attribute
a <- matrix(data = 1:9, nrow = 3)
class(a)
attributes(a)
dim(a)
a <- matrix(1:9, nrow = 3, byrow =T)
a
colnames(a) <- c("A", "B", "C")
rownames(a) <- c("X", "Y", "Z")
a
cbind(c(1, 2, 3), c(4, 5, 6))
rbind(c(1, 2, 3), c(4, 5, 6))

x <- 1:6
class(x)
dim(x) <- c(2,3)
x
class(x)

x <- matrix(1:9, nrow = 3, byrow = T)
x
colSums(x)
rowsum(x)
x+2
x*2
(a <- matrix(1:6, nrow =2))
(b <- matrix(1:6, nrow = 3))
a %*% b                         # for multiplication between matrices use %*%

m <- matrix(1:9, nrow = 3)
colnames(m) <- c("A", "B", "C")
rownames(m) <- c("X", "Y", "Z")
m
m[1, ]
class(m[1, ])
m[1, , drop = F]
class(m[1, , drop = F])
m[-2, ]
m[2, 2, drop = F]
m[1:2, c(1, 3)]
m["X", c("A", "B")]
m[1, c("A", "B"), drop = F]
m[m > 4]
m[c(T, F, T), c(T, T, F)]
m[m %% 2 == 0]
m[1, 1] <- 0
m

# FACTORS: used to store categorical data. factors are stored as vectors of integers mapped to a corresponding set of character values
sex_vector <- c("F", "M", "M", "F", "F")
sex_factor <- factor(sex_vector)
sex_factor

grade_vector <- c("A", "B", "A", "C", "B")
grade_factor <- factor(grade_vector, ordered = T,
                       levels = c("C", "B", "A"))
grade_factor
levels: C < B < A
levels(grade_factor) <- c("DISCRETE", "GOOD", "EXCELLENT")
grade_factor
(factor(grade_vector, ordered = T, levels = c("C", "B", "A"),
        labels = c("DISCRETE", "GOOD", "EXCELLENT")))
summary(sex_factor)

# DATA FRAMES: 2D data structure where each column contains values of one variable and each row contains a set of values from each column, data can be of different types
dat <- data.frame(id = 1:6,
                  name = c("Eokochia saxicola", "Cytisus aeolicus",
                           "Anthemis aeolica", "Centaurea aeolica",
                           "Silene hicesiae", "Genista tyrrhena"),
                  has_legumes = c(F, T, F, F, T, F),
                  population_size = c(50, 2000, 5000, 10000, 200, 3000),
                  growth_form = c("Herb", "Tree", "Herb", "Shrub", "Herb", "Tree")
)
dat
dat[["id"]]              # Several ways to index/subset a dataframe
class(dat["id"])
class(dat[["id"]])
dat[c("id", "name")]
dat[, c("id", "name")]
dat[1:2, c("id", "name")]
dat[dat$has_legumes == T, ]
dat[dat$population_size < 3000, ]
dat$growth_form <- NULL
dat
subset(dat, has_legumes == F)
subset(dat, population_size > 1000)
dim(dat)                            # check matrix dimension, structure
nrow(dat)
ncol(dat)
head(dat, 2)
tail(dat, 2)
class(dat)
str(dat)
summary(dat)

cbind(dat, 6:1)
cbind(dat, id.2 = 6:1)
dat$id.2 <- 6:1
dat
dat <- data.frame(
  id = 1:6,
  name = c("Eokochia saxicola", "Cytisus aeolicus",
           "Anthemis aeolica", "Centaurea aeolica",
           "Silene hicesiae", "Genista tyrrhena"),
  has_legumes = c(F, T, F, F, F, T),
  population_size = c(50, 2000, 5000, 10000, 200, 3000),
  growth_form = factor(c("Herb", "Tree", "Herb", "Shrub", "Herb", "Tree"))
)
newdata <- data.frame(
  id = 7,
  name = "Limonium minutiflorum",
  has_legumes = F,
  population_size = 2000,
  growth_form = "Herb"
)
rbind(dat, newdata)

# LISTS: 1D data structures that may be composed of different data types and data structures. Generalization of a vector.
vec <- 1:10
mat <- matrix(1:9, ncol = 3)
dat <- mtcars[1:3, ]
my_list <- list(vec, mat, dat)
my_list
my_list <- list(my_vector = vec,
                my_matrix = mat,
                my_df = dat)
my_list

my_list <- list(a = 1:3, b = c(T, F))
my_list[[1]]
my_list[["b"]]
my_list$b
my_list[[1]][1]
my_list[["c"]] <- matrix(1:4, nrow = 2)
my_list
my_list$d <-mtcars[1:2, 1:3]
my_list

# R SYNTAX: NULL, unll object, represents lists and vectors with 0 length, is returned by expressions and functions whose values is undefined, can be used to remove elements
class(NULL)
typeof(NULL)
as.null(1:3)
is.null(NULL)
is.null(1:3)
is.null(pairlist())
is.null(vector())
as.null(1:3)
length(NULL)

# NA, means "not applicable" or "not available", used to represent missing values. NA are contagious = if we do operations with an object including NAs, we will get NA as a result
class(NA)
typeof(NA)
vec <- c(1, NA, 4, 6, 10)
is.na(vec)
10 + NA
sum(c(1, 2, 3, NA))
sum(c(1, 2, 3, NA),
    na.rm = T)
na.omit(c(1, 2, 3, NA))
FALSE & NA
TRUE | NA
length(NA)

# NaN and Inf/-Inf, meaning "not a number", represents an undefined value resulting from "0/0. Inf and -Inf represent infinite values
class(NaN)
typeof(NaN)
0/0
is.nan(0/0)
length(NaN)
class(Inf)
typeof(-Inf)
1/0
-1/0
length(Inf)

# Installing and loading packages
install.packages()
update.packages()
library()

# PIPES, enables to write sequences of operations from left to right (or top to bottom) without storing intermediate variables
sqrt(log(42))
log_42 <- log(42)
sqrt(log_42)
42 |> log() |> sqrt()
# "f(g(x))" is equal to x |> g() |> f()

# Writing functions in R, are made up of three elements: function name, function arguments, function body
cheer <- function() {
  print("Hello there!")
}
cheer()
add_five <- function(x) {
  return(x + 5)
}
add_five(5)
multiply <- function(x, times = 2) {
  return(x * times)
}
multiply(5)

# PACKAGES, DUNE DATASET, IMPORT DATASET
install.packages("vegan")
library(vegan)
data("dune")       # community matrix describing abundances (following a cover scale) of 30 plant species in 20 Dutch dune meadows
data("dune.env")   # contains 5 environmental variables measured in the dune sites
?dune

# CSV and TXT, comma-separated values, common format for text delimited text files, usually uses a comma to separate values.
# TXT is a text document that contains plain text, values are often separated by tabs but can be separated also in other ways.
read.csv()
read.table()
read.delim()

# Iteration in R - for loops, while loops..
# for loop is composed by 5 elements: "for" keyword, the variable, the "in" keyword, the vector/list over you want to iterate, the code block containing the procedure we want to repeat
for (variable in vector) {
  ...somecode..
}

# HISTOGRAMS, graphical representations of the distribution of a numerical variable
hist(dune.env$A1,
     xlab = "Thickness of soil A1 horizon (cm)",
     main = "",
     breaks = 10)

# BAR CHARTS, used to visualize frequencies in the dataset of the classes of a qualitative variable
counts <- table(dune.env$Management)
counts
counts_two_var <- table(dune.env$Manure,
                        dune.env$Management)
counts_two_var
prop.table(counts_two_var, margin = 1)   # calculate the relative frequencies of the variables specifying by row or by column 
round(prop.table(counts_two_var, margin = 1), digits = 2)
barplot(counts,
        xlab = "Management Type")
barplot(counts_two_var,                                         # creating a stacked bar chart     
        main = "Plot Distribution by Manure and Management",
        xlab = "Management Type",
        ylab = "Manure Quantity",
        legend = rownames(counts),
        xlim = c(0, 6))

# BOXPLOTS, represents the distribution of the classes of a qualitative variable with respect to a quantitative variable.
boxplot(dune.env$A1 ~ dune.env$Use,
        xlab = "Use Type",
        ylab = "Thickness of soil A1 horizon (cm)")

# CONDITIONAL STATEMENTS IN R - if/else, are commands for handling decisions based on boolean conditions.
# They alter the control flow by executing a block of commands only if a condition defined by the user is satisfied.
# if statement
if(condition) {
  ...somecode...
}
# if and else statement
if (condition) {
  ...somecode...
} else {
  ...somecode
}
# multiple conditions
if (condition_1) {
  ...somecode...
} else if (condition_2) {
  ...somecode...
} else if (condition_3) {
  ...somecode...
} else {
  ...somecode...
}

# SCATTER PLOTS, graphical representation of the values of two variables (typically numerical) in a Cartesian plate. 
# Data are visualized as points, whose position is determined by their coordinates on the x-axis and the y-axis
sr <- specnumber(dune)
dune.env$sr <- sr
plot(sr ~ A1,
     data = dune.env,
     xlab = "Thickness of soil A1 horizon (cm)",
     ylab = "Species richness")

# DATA EXPORT, to creare a new directory into your project to save outputs you can navigate your project folder
# and create a new subfolder within it and call it "outputs".
# Alternatively, you can use the function "dir.create()"
dir.create(path = "outputs")

# GRAPH EXPORT
png(filename = "outputs/sr_vs_a1.png",
    width = 1800,
    height = 1800,
    res = 300)
plot(sr ~ A1,
      data = dune.env,
      xlab = "Thickness of soil A1 horizon (cm)",
      ylab = "Species richness")
dev.off

# TABLE EXPORT
write.table(x = dune.env,
            file = "outputs/dune_env.txt")
write.csv(x = dune.env,
          file = "outputs/dune_env.csv",
          row.names = F)

# PRESENCE/ABSENCE MATRIX
data(dune)
dune_pa <- decostand(x = dune,
                     method = "pa")

# CHI-SQUARED TEST, used to determine whether the frequencies of one or more variables
# in a contingency table are significantly different from the expected frequencies
# the null hypothesis is that the variables are independent
species_freq <- specnumber(dune, MARGIN = 2)
species_by_use <- aggregate(dune_pa[c("Scorautu", "Trifrepe")],
                                    by = list(dune.env$Use),
                                    FUN = "sum")
chisq.test(x = species_by_use[, -1])       # the function chisq.tes() executes the Pearson's chi-squared, which null hypothesis is that the variables are not independent
m1 <- matrix(rep(100, 4), ncol = 2)
m1
chisq.test(m1)
m2 <- matrix(c(100, 1, 1, 100), ncol = 2)
m2
chisq.test(m2)

# ANOTHER EXAMPLE OF CHI-SQUARED TEST
mat <- matrix((c(2, 9, 8, 1)), ncol = 2)
mat
colnames(mat) <- c("sp1", "sp2")
rownames(mat) <- c("habitat1", "habitat2")
mat
chisq.test(mat)    # test if the 2 species have similar distribution in the 2 habitats.
mat[, 2] <- c(1, 8)
chisq.test(mat)

# T-TEST, used to determine whether the mean values of two samples are significantly different from each other (2 sample t-test)
library(vegan)
data(dune)
data("dune.env")
dune.env$sr <- specnumber(dune)
boxplot(dune.env$sr~dune.env$Management)
t.test(dune.env$sr[dune.env$Management == "HF"],
       dune.env$sr[dune.env$Management != "HF"],    # != not equal to operator. Means to take all the values differing from the one specified
       alternative = "greater")

# CORRELATION TEST, is used to determine whether there is a linear correlation between two numeric variables.
plot(dune.env$A1,
     dune.env$sr)
cor.test(dune.env$sr,
         dune.env$A1,
         alternative = "less")     # "less" is used to test a negative correlation, "greater" is used for positive correlations
plot(mtcars$disp,
     mtcars$hp)
cor.test(mtcars$disp,
         mtcars$hp,
         alternative = "greater")

# LINEAR REGRESSION, approach to model the linear correlation between one or more explanatory variables
mod <- lm(hp ~ disp, data = mtcars)
summary(mod)
# residuals are the difference between the observed and the predicted values. In linear regression they should be normally distributed
# coefficients represent the intercept (a) and the slope (b) of the model formula y = a + bx. Pr(>|t|) is the p-value associated to the estimate coefficients.
# the adjusted R^2 represents how much variance is explained by the model. The p-value gives the significativity of the model.
plot(mtcars$disp,
     mtcars$hp)
abline(mod$coefficients[1], mod$coefficients[2])

# SHAPIRO-WILK TEST, used to determine whether the data are normally distributed. The null hypothesis is that the data distribution is normal
shapiro.test(dune.env$sr)
hist(dune.env$A1)
shapiro.test(dune.env$A1)
