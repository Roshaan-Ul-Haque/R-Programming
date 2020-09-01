#R Programming

a = 5
class(a)


[1] "numeric"


a = 4L
class(a)


[1] "integer"


a = 1.11
class(a)


[1] "numeric"


x <- 10
x


[1] 10


19 -> y
y


[1] 19


z <- 1:100
z


[1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19
[20]  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38
[39]  39  40  41  42  43  44  45  46  47  48  49  50  51  52  53  54  55  56  57
[58]  58  59  60  61  62  63  64  65  66  67  68  69  70  71  72  73  74  75  76
[77]  77  78  79  80  81  82  83  84  85  86  87  88  89  90  91  92  93  94  95
[96]  96  97  98  99 100


# The c() function can be used to create vectors of objects.

x <- c(0.5,0.8) # numeric
x <- c(TRUE, FALSE) #logical
x <- c(T, F) #logical
x <- c("a", "b", "c") #character
x <- c(1:100) #integer
x <- c(1+0i, 2+0i) #complex

# Using the vector() function

x <- vector("numeric", length = 10) # we do not use this
x


[1] 0 0 0 0 0 0 0 0 0 0


# Mixing Object

y <- c(1.5, "a")#character
y <- c(TRUE, 2) #numeric
y <- c("a", TRUE) #character

# When different objects are mixed in a vector, coercion occurs so that every 
# element in the vector is of the same class.

# Explicit Coercion

# Object can be explicitly coerced from one class to another using the "as." 
# functions, if available.

a <- 0:10
class(a)


[1] "integer"


as.numeric(a)


[1]  0  1  2  3  4  5  6  7  8  9 10


as.logical(a)


[1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE


as.character(a)


[1] "0"  "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10"


as.complex(a)


[1]  0+0i  1+0i  2+0i  3+0i  4+0i  5+0i  6+0i  7+0i  8+0i  9+0i 10+0i


a <- c("a", "b", "c")
class(a)


[1] "character"


as.numeric(a)


[1] NA NA NA


as.logical(a)


[1] NA NA NA


x <- matrix(nrow = 2,ncol = 3)
x


     [,1] [,2] [,3]
[1,]   NA   NA   NA
[2,]   NA   NA   NA


dim(x)


[1] 3 3


attributes(x)


[1] 3 3



# Matrices are constructed column-wise, so entries can be thought of starting in
# the "upper-left" corner and running down the columns.

x = matrix(1:9, nrow = 3, ncol = 3)
x


     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9


# Matrices can also be created directly from vectors by adding a dimension attribute.

x <- 1:9
x


[1] 1 2 3 4 5 6 7 8 9


dim(x) <- c(3, 3)
x


      [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9


# Matrices can be created by column-binding or row-binding with cbind() and rbind().

x <- 2:4
y <- 5:7

cbind(x, y)


     x y
[1,] 2 5
[2,] 3 6
[3,] 4 7

     
rbind(x, y)


   [,1] [,2] [,3]
x    2    3    4
y    5    6    7


# Lists
# Lists are a special type of vector that can contain elements of different classes.
# Lists are a very important data type in R snd you should get to know them well,

x <- list(0, "Ali", FALSE, 9+3i)
x


[[1]]
[1] 0

[[2]]
[1] "Ali"

[[3]]
[1] FALSE

[[4]]
[1] 9+3i


# Factors

x <- factor(c("ali", "ali", "farhan", "adil", "farhan"))
x


[1] ali    ali    farhan adil   farhan
Levels: adil ali farhan


unclass(x)


[1] 2 2 3 1 3
attr(,"levels")
[1] "adil"   "ali"    "farhan"


# The order of the levels can be set using the levels argument to factor().

x <- factor(c("ali", "ali", "farhan", "adil", "farhan"))
(levels <- c("ali", "farhan", "adil"))


[1] "ali"    "farhan" "adil"


#Or

x <- factor(c("ali", "ali", "farhan", "adil", "farhan"))
factor(x, levels <- c("ali", "farhan", "adil"))


[1] ali    ali    farhan adil   farhan
Levels: ali farhan adil


#Or

x <- factor(c("ali", "ali", "farhan", "adil", "farhan"))
factor(levels <- c("ali", "farhan", "adil"))


[1] ali    farhan adil  
Levels: adil ali farhan


# Week Days

days <- factor(c("Tuesday", "Monday", "Friday", "Sunday", "Wednesday", "Saturday", "Thursday"))
days


[1] Tuesday   Monday    Friday    Sunday    Wednesday Saturday  Thursday 
Levels: Friday Monday Saturday Sunday Thursday Tuesday Wednesday


unclass(days)


[1] 6 2 1 4 7 3 5
attr(,"levels")
[1] "Friday"    "Monday"    "Saturday"  "Sunday"    "Thursday"  "Tuesday"  
[7] "Wednesday"


days <- factor(c("Tuesday", "Monday", "Friday", "Sunday", "Wednesday", "Saturday", "Thursday"))
factor(levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))


factor(0)
Levels: Monday Tuesday Wednesday Thursday Friday Saturday Sunday


# Missing Values

# NA = Not applicable means null
# NaN = Not a number

x <- c(1, 2, 3, 4, 5, NA)

is.na(x)


[1] FALSE FALSE FALSE FALSE FALSE  TRUE


is.nan(x)


[1] FALSE FALSE FALSE FALSE FALSE FALSE


x <- c(NaN, 1, 2, 3, 4, 5, NA)


is.na(x)


[1]  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE


is.nan(x)


TRUE FALSE FALSE FALSE FALSE FALSE FALSE

# Data Frames

x <- data.frame(students = 1:2, names = c("Ali", "Ahmed"))
x


  students names
1        1   Ali
2        2 Ahmed


nrow(x)


[1] 2


ncol(x)


[1] 2


row.names(x) <- c("a", "b")
x


  students names
a        1   Ali
b        2 Ahmed


# Names

x <- 1:2
names(x)


NULL


x


[1] 1 2


names(x) <- c("Ali", "Ammar")
x


Ali Ammar 
  1     2 

  
names(x)


[1] "Ali"   "Ammar"


x <- list(days = 1:7, names = c("Ali", "Ahmed"))
x


$days
[1] 1 2 3 4 5 6 7

$names
[1] "Ali"   "Ahmed"


x$days


[1] 1 2 3 4 5 6 7


x$names


[1] "Ali"   "Ahmed"


# Names in matrices

m <- matrix(1:9, nrow = 3, ncol = 3)
dimnames(m) <- list(c("r1","r2","r3"),c("c1","c2","c3"))
m


   c1 c2 c3
r1  1  4  7
r2  2  5  8
r3  3  6  9


?read.table

help.search("data input")

# Subsetting

x <- c("a", "b", "c", "d", "a", "b", "c", "d")
x[1]


[1] "a"


x[4]


[1] "d"


x[2:5]


[1] "b" "c" "d" "a"


x[x>"a"]


[1] "b" "c" "d" "b" "c" "d"


x[x>"b"]


[1] "c" "d" "c" "d"


x[x>"c"]


[1] "d" "d"


x[x>"d"]


character(0)


u <- x > "c"

u


[1] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE


x[u]


[1] "d" "d"


#(1)Matrix

x <- matrix(1:6, 2, 3)
x


    [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6


x[1,2]


[1] 3


x[2,1]


[1] 2


x[1,]


[1] 1 3 5


x[,2]


[1] 3 4


x[2,]


[1] 2 4 6


x[,3]


[1] 5 6


x[1,3, drop=FALSE]


     [,1]
[1,]    5


x[,3, drop=FALSE]


     [,1]
[1,]    5
[2,]    6


x[2,, drop=FALSE]


     [,1] [,2] [,3]
[1,]    2    4    6


#(2) List

x <- list(weekday = 1:7, wind_prob = 0.5)
x[1]


$weekday
[1] 1 2 3 4 5 6 7


#Or

x[[2]]


[1] 0.5


#Or

x$weekday


[1] 1 2 3 4 5 6 7


#Or

x[["wind_prob"]]


[1] 0.5


#Or

x["wind_prob"]


$wind_prob
[1] 0.5


x[c(1, 2)]


$weekday
[1] 1 2 3 4 5 6 7

$wind_prob
[1] 0.5


days <- "weekday"

x[[days]] #computed index for 'weekday'


[1] 1 2 3 4 5 6 7


x$days #element 'days' does not exist


NULL


x$weekday #element 'weekday' does exist


[1] 1 2 3 4 5 6 7


x <- list(a = list(1,2,3,4,5), b = c(1.1,2.1,3.1,4.1,5.1))
x[[c(1,5)]]


[1] 5


#Or

x[[1]][[5]]


[1] 5


x[[c(2,5)]]


[1] 5.1


#Or

x[[2]][[5]]


[1] 5.1


#Removing  NA values

x <- c(1, 2, 3, NA, 5, 6, NA, NA, 8)
is.na(x)


[1] FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE


z <- is.na(x)

z


[1] FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE


!z


TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE


x <- c(1, 2, 3, NA, 5, 6)
y <- c(8, 9, NA, 10, NA, 12)
z <- complete.cases(x,y)
z


[1]  TRUE  TRUE FALSE FALSE FALSE  TRUE


z <- complete.cases(x)
z


[1]  TRUE  TRUE  TRUE FALSE  TRUE  TRUE


z <- complete.cases(y)
z


[1]  TRUE  TRUE FALSE  TRUE FALSE  TRUE


airquality

View(airquality)

mydatasets <- airquality

View(mydatasets)

r <- complete.cases(mydatasets)

mydatasets[r,]

mydatasets[r,][1:10,]


   Ozone Solar.R Wind Temp Month Day
1     41     190  7.4   67     5   1
2     36     118  8.0   72     5   2
3     12     149 12.6   74     5   3
4     18     313 11.5   62     5   4
7     23     299  8.6   65     5   7
8     19      99 13.8   59     5   8
9      8      19 20.1   61     5   9
12    16     256  9.7   69     5  12
13    11     290  9.2   66     5  13
14    14     274 10.9   68     5  14


#If Else

x <- 1
y <- 2
if(x > 3){
  y <- 5
} else {
  y <- 10
}

y <- if(x > 3){
  10
} else {
  0
}

for(i in 1:10){
  print(i)
}


[1] 1
[1] 2
[1] 3
[1] 4
[1] 5
[1] 6
[1] 7
[1] 8
[1] 9
[1] 10


x <- c("Ali", "Usman", "Razzaq", "Ammar")
for(i in 1:4){
  print(x[i])
}


[1] "Ali"
[1] "Usman"
[1] "Razzaq"
[1] "Ammar"


#Or

x <- c("Ali", "Usman", "Razzaq", "Ammar")
for(i in seq_along(x)){
  print(x[i])
}


[1] "Ali"
[1] "Usman"
[1] "Razzaq"
[1] "Ammar"


#Or

x <- c("Ali", "Usman", "Razzaq", "Ammar")
for(letter in x){
  print(letter)
}


[1] "Ali"
[1] "Usman"
[1] "Razzaq"
[1] "Ammar"

#Or

x <- c("Ali", "Usman", "Razzaq", "Ammar")
for(i in 1:4) print(x[i])


[1] "Ali"
[1] "Usman"
[1] "Razzaq"
[1] "Ammar"


x <- matrix(1:6, 2, 3)
for(i in  seq_len(nrow(x))){
  for(j in  seq_len(ncol(x))){
    print(x[i, j])
  }
}


[1] 1
[1] 3
[1] 5
[1] 2
[1] 4
[1] 6


#While

count <- 0
while(count < 10){
  print(count)
  count = count + 1
}


[1] 0
[1] 1
[1] 2
[1] 3
[1] 4
[1] 5
[1] 6
[1] 7
[1] 8
[1] 9


x <-  10
while(x >= 5 && x <= 15){
  print(x)
  coin <- rbinom(1, 1, 0.5)
  
  if (coin == 1){##random walk
    x <- z+1
  } else{
    x <- x-1
  }
}


[1] 10
[1] 9
[1] 8


#Functions

x <- function(a,b = 1,c = 2,d=NULL){
  print(a)
  print(b)
  print(c)
  print(d)
}
x(2)


[1] 2
[1] 1
[1] 2
NULL


x <- function(a,b){
  a^2+b^3
}
x(5,9)


[1] 754


x <- function(a,b){
  print(a)
  print(b)
}
x(1)


[1] 1
Error in print(b) : argument "b" is missing, with no default


x <- function(a,b){
  print(a)
  print(b)
}
x(b=1)


Error in print(a) : argument "a" is missing, with no default


x <- function(a=0,b){
  print(a)
  print(b)
}
x(b=1)


[1] 0
[1] 1


x <- function(a=0,b){
  print(a)
  print(b)
}
x(,1)


[1] 0
[1] 1

  
mydata <- rnorm(100)
sd(mydata)


[1] 0.9891972


#Or

sd(x = mydata)


[1] 0.9891972


#Or

sd(x = mydata, na.rm = FALSE)


[1] 0.9891972


#Or

sd(na.rm = FALSE, x = mydata)


[1] 0.9891972


#Or

sd(na.rm = FALSE, mydata)


[1] 0.9891972


x <- rnorm(100)
sd(x)


[1] 0.9492675


args(lm)


function (formula, data, subset, weights, na.action, method = "qr", 
          model = TRUE, x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE, 
          contrasts = NULL, offset, ...) 
NULL


mydata <- data.frame(x=rnorm(100),y=rnorm(100))
lm(y~x,mydata,model = FALSE)


Call:
lm(formula = y ~ x, data = mydata, model = FALSE)

Coefficients:
(Intercept)            x  
    0.06087     -0.13732


#Or

    
lm(data = mydata,y~x,model = FALSE, 1:100)


Call:
lm(formula = y ~ x, data = mydata, subset = 1:100, model = FALSE)

Coefficients:
(Intercept)            x  
    0.06087     -0.13732  


#Vectorized Operations

x <- 1:5    #The number quantity must be same
y <- 6:10   #If is not same, at the end it will start from 1st number

x+y


[1]  7  9 11 13 15


x>y


[1] FALSE FALSE FALSE FALSE FALSE


#Or

x>=y


[1] FALSE FALSE FALSE FALSE FALSE


x<y


[1] TRUE TRUE TRUE TRUE TRUE


#Or

x<=y


[1] TRUE TRUE TRUE TRUE TRUE


x*y


[1]  6 14 24 36 50


x/y


[1] 0.1666667 0.2857143 0.3750000 0.4444444 0.5000000


x <- 1:3    #The number quantity must be same
y <- 6:9    #If is not same, at the end it will start from 1st number

x+y


[1]  7  9 11 10


x>y


[1] FALSE FALSE FALSE FALSE


#Or

x>=y


[1] FALSE FALSE FALSE FALSE


x<y


[1] TRUE TRUE TRUE TRUE


#Or

x<=y


[1] TRUE TRUE TRUE TRUE


x*y


[1]  6 14 24  9


x/y


[1] 0.1666667 0.2857143 0.3750000 0.1111111


y <- matrix(rep(100,9), 3,3) #rep uses for repetition of number
y


     [,1] [,2] [,3]
[1,]  100  100  100
[2,]  100  100  100
[3,]  100  100  100


x <- matrix(1:9, 3,3);y <- matrix(rep(100,9), 3,3)
x


     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9


x*y


     [,1] [,2] [,3]
[1,]  100  400  700
[2,]  200  500  800
[3,]  300  600  900


x/y


     [,1] [,2] [,3]
[1,] 0.01 0.04 0.07
[2,] 0.02 0.05 0.08
[3,] 0.03 0.06 0.09


x%*%y #true matrix multiplication


     [,1] [,2] [,3]
[1,] 1200 1200 1200
[2,] 1500 1500 1500
[3,] 1800 1800 1800


#Date and Time

as.Date("1970-01-01")


[1] "1970-01-01"


as.POSIXct("1970-01-01")


[1] "1970-01-01 +05"


as.POSIXlt("1970-01-01")


[1] "1970-01-01 +05"


x <- Sys.time()
x


[1] "2020-09-01 04:41:23 PKT"


# POSIXlt function
p <- as.POSIXlt(x)
p


[1] "2020-09-01 04:41:23 PKT"


names(unclass(p))


[1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"   "yday"  
[9] "isdst"  "zone"   "gmtoff"


p$sec


[1] 23.12421


p$min


[1] 41


p$wday


[1] 2


#POSIXct function
b <- as.POSIXct(x)
b


[1] "2020-09-01 04:41:23 PKT"


b$sec


Error in b$sec : $ operator is invalid for atomic vectors

#To run the above command first we have to convert this in POXIClt format.
z <- as.POSIXlt(b)
z


[1] "2020-09-01 04:41:23 PKT"


z$sec


[1] 23.12421


# For times in R we use strptime function
datestring <- c("January 10, 2012 10:40, December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x


[1] "2012-01-10 10:40:00 PKT"


class(x)


[1] "POSIXlt" "POSIXt"


x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y


Error in x - y : non-numeric argument to binary operator
In addition: Warning message:
Incompatible methods ("-.Date", "-.POSIXt") for "-"


class(x)


[1] "Date"

class(y)


[1] "POSIXlt" "POSIXt"


x <- as.POSIXlt(x)
x-y


Time difference of 356.7261 days


x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x-y


Time difference of 2 days


x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x


Time difference of 10 hours


#Loop Function
#Lapply

x <- list(a = 1:5, b = rnorm(10))
x


[1]  0.27399345 -0.43375544 -0.22421928 -0.75075306 -1.46499258  1.91052911
[7] -0.41261831 -0.06779854 -0.18394143  0.30349763


class(x)



[1] "list"


lapply(x, mean)


$a
[1] 3

$b
[1] -0.1050058

mean(x$a)


[1] 3


mean(x$b)


[1] -0.1050058


x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100, 5))
x

lapply(x, mean)


$a
[1] 2.5

$b
[1] -0.07191224

$c
[1] 0.4686354

$d
[1] 5.019259


lapply(x, sum)


$a
[1] 10

$b
[1] -0.7191224

$c
[1] 9.372708

$d
[1] 501.9259


?runif

x <- 1:4
lapply(x, runif)


[[1]]
[1] 0.3680386

[[2]]
[1] 0.38304944 0.02393418

[[3]]
[1] 0.1076965 0.4740753 0.8662969

[[4]]
[1] 0.04278906 0.65381628 0.45402259 0.05506808


runif(1)


[1] 0.2443563


runif(2)


[1] 0.4053007 0.7137585


x <- 1:4
names(x) <- c('a','b','c','d')
lapply(x, runif)


$a
[1] 0.5109566

$b
[1] 0.2855646 0.3446587

$c
[1] 0.2421505 0.7511626 0.8707391

$d
[1] 0.3625871 0.4713629 0.8423454 0.6008105


x <- 1:4
names(x) <- c('a','b','c','d')
lapply(x, runif, min = 50, max = 100)


$a
[1] 73.56994

$b
[1] 50.51938 52.85903

$c
[1] 59.57194 88.59229 85.34113

$d
[1] 71.95749 90.56681 62.57745 51.08591


#sapply

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100, 5))
sapply(x, mean)


         a           b           c           d 
2.50000000 -0.06867153  1.37749600  4.94314965 


#Apply

x <- matrix(rnorm(200), 20, 10)
x

apply(x, 1, mean)


[1]  0.47562432 -0.46681639 -0.06337120  0.27733254 -0.07460545  0.14517942
[7] -0.43605995 -0.16179185  0.98167069 -0.29604216  0.21660100  0.19832155
[13]  0.19016662 -0.04072476  0.07840031  0.23173286 -0.05983208  0.30040054
[19] -0.22821390 -0.07010193


#To verify the values
rowMeans(x)


[1]  0.47562432 -0.46681639 -0.06337120  0.27733254 -0.07460545  0.14517942
[7] -0.43605995 -0.16179185  0.98167069 -0.29604216  0.21660100  0.19832155
[13]  0.19016662 -0.04072476  0.07840031  0.23173286 -0.05983208  0.30040054
[19] -0.22821390 -0.07010193


apply(x, 1, sum)


[1]  0.43332600  0.37808984 -0.27111801  0.15688717 -0.27397112  0.13276270
[7]  0.71257595 -0.53084568 -0.34571397  0.15424234  0.19119830  0.32304267
[13] -0.17940568 -0.27807033 -0.17829873  0.18038831 -0.14702965 -0.24670628
[19] -0.17226049  0.03428506


#To verify the values
rowSums(x)


[1]  0.43332600  0.37808984 -0.27111801  0.15688717 -0.27397112  0.13276270
[7]  0.71257595 -0.53084568 -0.34571397  0.15424234  0.19119830  0.32304267
[13] -0.17940568 -0.27807033 -0.17829873  0.18038831 -0.14702965 -0.24670628
[19] -0.17226049  0.03428506


apply(x, 2, mean)


[1]  0.42926638 -0.15427763  0.13339833 -0.30237338  0.25593308 -0.08707671
[7]  0.08466667 -0.05143473 -0.18286138 -0.08855142


#To verify the values
colMeans(x)


[1]  0.42926638 -0.15427763  0.13339833 -0.30237338  0.25593308 -0.08707671
[7]  0.08466667 -0.05143473 -0.18286138 -0.08855142


apply(x, 2, sum)


[1]  8.585328 -3.085553  2.667967 -6.047468  5.118662 -1.741534  1.693333 -1.028695
[9] -3.657228 -1.771028


#To verify the values
colSums(x)


[1]  8.585328 -3.085553  2.667967 -6.047468  5.118662 -1.741534  1.693333 -1.028695
[9] -3.657228 -1.771028


#Other ways to Apply
x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile)
apply(x, 1, quantile, probs = c(0.25, 0.75))


[,1]       [,2]       [,3]       [,4]       [,5]       [,6]       [,7]
25% -1.48870459 -0.2022381 -0.6528589 -1.3888946 -0.5784604 -0.1110067 0.01790416
75%  0.06794751  0.6798358  1.0110223  0.6042872  0.9333693  1.0007092 0.74804560
[,8]      [,9]      [,10]      [,11]      [,12]     [,13]      [,14]
25% -0.8483499 0.2270368 -1.2925943 -0.8746515 -0.9424396 -1.159480 -0.2839482
75%  0.4868018 0.9344003  0.5306885 -0.1588471  0.5584084  1.494832  0.9666632
[,15]      [,16]       [,17]      [,18]       [,19]      [,20]
25% -0.6775704 -0.5199507 -0.06547349 -0.4994229 -0.02546064 -0.8338754
75%  0.3132334  0.8095305  0.49296785  1.1520076  0.68702595  0.9130557


#Tapply

x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3, 10)
f


[1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
Levels: 1 2 3


tapply(x, f, mean)


        1         2         3 
0.2768197 0.3941287 0.9823138


#Take group means without simplification

tapply(x, f, mean, simplify = FALSE)


$`1`
[1] 0.2768197

$`2`
[1] 0.3941287

$`3`
[1] 0.9823138


#To find group range
tapply(x, f, range)


$`1`
[1] -1.074516  2.003951

$`2`
[1] 0.06670377 0.83889125

$`3`
[1] 0.1976142 1.9571179


#Split

x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3, 10)
split(x, f)


$`1`
[1] -1.0298635 -0.4882905  0.3218858 -2.1808220 -0.8027315  0.1350136 -0.2050364
[8] -0.6300243 -1.2674497 -0.6925916

$`2`
[1] 0.89938268 0.81680106 0.16473574 0.06534607 0.58750262 0.41294422 0.42443417
[8] 0.44825018 0.22360692 0.31312420

$`3`
[1]  0.1463238  2.6419912 -0.7889119  1.7916463 -0.5362383  0.4931631  0.6105500
[8]  3.1136125  1.1984660  0.9953806


lapply(split(x, f), mean)


$`1`
[1] -0.683991

$`2`
[1] 0.4356128

$`3`
[1] 0.9665983


library(datasets)
head(airquality)


  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
5    NA      NA 14.3   56     5   5
6    28      NA 14.9   66     5   6


#Split a Data Frame
s <- split(airquality, airquality$Month)
s

lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))


$`5`
Ozone  Solar.R     Wind 
NA       NA 11.62258 

$`6`
Ozone   Solar.R      Wind 
NA 190.16667  10.26667 

$`7`
Ozone    Solar.R       Wind 
NA 216.483871   8.941935 

$`8`
Ozone  Solar.R     Wind 
NA       NA 8.793548 

$`9`
Ozone  Solar.R     Wind 
NA 167.4333  10.1800 


head(s$'5')


  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
5    NA      NA 14.3   56     5   5
6    28      NA 14.9   66     5   6


head(s$'8')           


   Ozone Solar.R Wind Temp Month Day
93    39      83  6.9   81     8   1
94     9      24 13.8   81     8   2
95    16      77  7.4   82     8   3
96    78      NA  6.9   86     8   4
97    35      NA  7.4   85     8   5
98    66      NA  4.6   87     8   6


table(airquality$Month)


5  6  7  8  9 
31 30 31 31 30


lapply(s, function(x) colSums(x[, c("Ozone", "Solar.R", "Wind")]))


$`5`
Ozone Solar.R    Wind 
NA      NA   360.3 

$`6`
Ozone Solar.R    Wind 
NA    5705     308 

$`7`
Ozone Solar.R    Wind 
NA  6711.0   277.2 

$`8`
Ozone Solar.R    Wind 
NA      NA   272.6 

$`9`
Ozone Solar.R    Wind 
NA  5023.0   305.4


#Another way to do this
fc = function(x) colSums(x[, c("Ozone", "Solar.R", "Wind")])
lapply(s, fc)


$`5`
Ozone Solar.R    Wind 
NA      NA   360.3 

$`6`
Ozone Solar.R    Wind 
NA    5705     308 

$`7`
Ozone Solar.R    Wind 
NA  6711.0   277.2 

$`8`
Ozone Solar.R    Wind 
NA      NA   272.6 

$`9`
Ozone Solar.R    Wind 
NA  5023.0   305.4
      
 
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))


5         6          7        8        9
Ozone         NA        NA         NA       NA       NA
Solar.R       NA 190.16667 216.483871       NA 167.4333
Wind    11.62258  10.26667   8.941935 8.793548  10.1800


sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))       


5         6          7          8         9
Ozone    23.61538  29.44444  59.115385  59.961538  31.44828
Solar.R 181.29630 190.16667 216.483871 171.857143 167.43333
Wind     11.62258  10.26667   8.941935   8.793548  10.18000


#Another way to do this
sfc = function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE)
sapply(s, sfc)


                5         6          7          8         9
Ozone    23.61538  29.44444  59.115385  59.961538  31.44828
Solar.R 181.29630 190.16667 216.483871 171.857143 167.43333
Wind     11.62258  10.26667   8.941935   8.793548  10.18000


#Another way to do this
sfc = function(x) 
{
  colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE)
}
sapply(s, sfc)


                5         6          7          8         9
Ozone    23.61538  29.44444  59.115385  59.961538  31.44828
Solar.R 181.29630 190.16667 216.483871 171.857143 167.43333
Wind     11.62258  10.26667   8.941935   8.793548  10.18000