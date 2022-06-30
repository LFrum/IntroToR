library(s20x)
data(package = "s20x")

demo(package="s20x")

windows()
demo(package="s20x","cs1")

install.packages("ggplot2")

help("table")
?read.table

#Unit 2 Quiz
1.2e3
z=2.8-7i
lm(z)
ceiling(3.1)
log(27,3)
119%%13
119%/%13
13*9

x = sqrt(2)
x
x*x == 2
x*x
x == sqrt(2)

y<-c(8,3,5,7,4,11)
sort(y)
length(y)

x = 1:10
sum(x<=5) 
sum(5>x)
x<=5

#Unit 2 Assignment
library(s20x)
data(apples.df)
weights=apples.df$Weight
sum(weights<1000)

mWeights <- matrix(sort(weights),byrow=T,nrow=26,ncol=4)
mWeights[1,1]
mWeights[25,4]

sum(weights[1:2])
weights[1:10]
sum(weights[1:5])
sum(weights[1:20])

u=10
t=4
a=3

u*t + (1/2)*a*(t**2)
