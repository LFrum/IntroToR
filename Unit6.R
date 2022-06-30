#Intro to R
#Unit 6 Lecture
#18 November 2020

#########################
# Lecture
#########################

#quanlitative define categories (factor) - different level
#quantitative define numbers

#plotting quantitative variables
x = 1:30
y = 2 + 4*x + rnorm(30,0,10)

#either one create the same plot
plot(x,y)
plot(y~x)

#NOTES:
#pch - plot character (square,circle, etc)
#bg - background color
#cex - size of pch
plot(x, y, pch = 21, bg = "blue", cex =2)

#las = 2 - rotate x-axis
plot(x, y, xlab="Independent variable",
     ylab="Dependent variable",
     main="Simple Linear Regression",
     pch = 21, bg = "blue", cex =2, las = 2)

class(y~x)

with(ddt, plot(LENGTH~WEIGHT, 
               pch = 21, bg = "green3", 
               cex=2))

plot(LENGTH~WEIGHT, 
     pch = 21, bg = "green3", 
     cex=2, data = ddt)

with(subset(ddt, WEIGHT > 1000,), 
     text(WEIGHT, LENGTH, SPECIES))

with(subset(ddt, WEIGHT > 1000,),{ 
     text(WEIGHT, LENGTH, SPECIES);
  points(WEIGHT, LENGTH, col = "red", cex = 3)})

abline(v=1000, col="Purple", lwd=3)

#The following will add to a plot
text()
mtext()
points()
axis()
lines()
arrows()
polygon()
segments()
box()
abline()

y.lm = with(ddt, lm(LENGTH~WEIGHT+I(WEIGHT^2)))
coef(y.lm)
summary(y.lm)
mysq = function(x) coef(y.lm)[1] + coef(y.lm)[2]*x + coef(y.lm)[3]*x^2
curve(mysq(x), lwd=4, col="Pink", add=TRUE)

#Plotting: Multiple Plots
#Example-1
windows()
par(fig=c(0.1,0.7,0.1,0.6)) #X1,X2,Y1,Y2
plot(LENGTH~WEIGHT, data = ddt, col="Blue", pch=19)
par(new=T)
par(fig=c(0.3,0.8,0.3,0.7))
plot(WEIGHT~DOT, data =ddt, col="Red", pch=19)

#Example-2
windows()
layout(matrix(1:4, nr=2,nc=2, byrow=TRUE))
layout.show(4)
layout(matrix(1:4, nr=2, nc=2, byrow=TRUE), width = c(1,2))
layout.show(4)
layout(matrix(1:4, nr=2, nc=2, byrow=TRUE), width = c(1,2), height=c(1,2))
layout.show(4)
#1st-plot
plot(LENGTH~WEIGHT,data=ddt)
#2nd-plot
plot(LENGTH~DDT, data=ddt)
#add points into 2nd plot
with(subset(ddt,DDT>300,), points(DDT,LENGTH, col="Red",pch=19,cex=2))
#3rd-plot
plot(LENGTH~SPECIES, data=ddt)
#4th-plot
plot(LENGTH~RIVER, data=ddt)

#Plotting: Margins
windows()

par(omi=rep(0,4),mar=c(5.1,10.1,4.1,2.1),
    mfrow=c(1,1))
plot(LENGTH~RIVER,data=ddt)
mtext("Different Length of Fish", side=2,line=9)
mtext("Here is another m label", side=2,line =6)
axis(3,1:4,1:4)
axis(4,20:50,seq(20,50,by=1))

#########################
# QUIZ
#########################
?plot

?legend

?text

?hist
head(course.df)
hist(course.df$Exam,breaks = 10)
#########################
# ASSIGNMENT
#########################
library("s20x")
data("zoo.df")
head(zoo.df)
zoo = within(zoo.df, 
     { 
       nice.day <- factor(nice.day)
       day.type <- factor(day.type)
     }
)

zoo$nice.day
summary(zoo)

plot(zoo$tv.ads,zoo$attendance)
with(subset(zoo,tv.ads>0.4,), 
     points(tv.ads,attendance, 
            col="Red",pch=1,cex=2))

plot(subset(zoo,tv.ads>0.4,tv.ads))
plot(zoo$[,tv.ads>0.4])
plot(zoo$[zoo$tv.ads>0.4,])
plot(subset(zoo,tv.ads>0.4,))
plot(zoo[,tv.ads>0.4])
plot[zoo[,zoo$tv.ads>0.4]]

plot(zoo$tv.ads,zoo$attendance,  
     pch=15, type="b")
