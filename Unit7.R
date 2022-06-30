#6 December 2020
#Intro to R
#Unit 7

#TOPIC: Function

mytri = function() #no arguments
{
  a <- as.numeric(readline(prompt="adjacent= "))
  o <- as.numeric(readline(prompt="opposite= "))
  sqrt(a^2 + o^2)
}

mytri()

myoutput = function(x)
{
  mn = mean(x)
  std = sd(x)
  md = median(x)
  
  list(mean=mn, sd=std, median=md)
}

myoutput(1:5)

#collect output
obj = myoutput(1:5)

obj$mean

obj$sd

obj$median

mybiglist = function(x,y,z)
{
  sx = summary(x)
  syy = y^2
  z3 = z^3
  
  #THIS LIST BELOW WILL BE THE OUTPUT
  list(summaryofx=sx, sqy=syy, zcubed=z3)
}

mybiglist(x=1:10,y=1:3,z=3:9)

obj2= mybiglist(x=1:10,y=1:3,z=3:9)
obj2$sqy

myxsq=function(x) x^2

myxsq (obj2$zcubed)



############################
#ASSIGNMENT
############################

library(s20x)
data(package="s20x")
data(fire.df)
head(fire.df)

mydata <- function (df,n) 
{
  df[1:n,]
}
mydata(df=fire.df,n=8)


myplot=function(x,y)
{
  plot(y~x,pch=22,bg="Blue")
  text(x,y,paste("(",x, " , ", y,")"))
  y.lm = lm (y~x)
  abline(y.lm, lwd=1.5,col="Red")
  list(xm=x, ym=y)
}
windows()

myplot(x=fire.df$distance,y=fire.df$damage)

#what is AAA replaced for in text(x,y,AAA)
#ANSWER: paste("(",x, " , ", y,")")

