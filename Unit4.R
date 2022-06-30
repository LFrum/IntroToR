#Intro to R
#Unit 4 Lecture
#10 November 2020

Lst <- list(Student = "Thomas Jefferson", Teacher = "Dr Stewart", Course = "Statistics",
            Clicker = c(40,70,75), Exams = c(80,95))
Lst

Lst[["Teacher"]]
Lst[['Teacher']]
Lst$Teacher
Lst[[2]]

Lst$Exams[2]
Lst [[5]][2]

sbLst = Lst[1:3]
sbLst

mat = matrix(1:10, nr = 5, nc = 2, byrow= TRUE)

#sequence of number from 1 to 100 by 5
s1 = seq(1,100,by =5)

Lst2 = list(seq1=s1, mat1=mat)
Lst2

Lst3 = c(Lst, Lst2)
Lst3


#DATA FRAME
#matrix with variable of different data type

#subset and with can do similar thing

#do NOT use attach fucntio to attached data
#eventhough the variable automatically attached
#to the environment, different data frame
#might have the same variable

data.frame(x=1:10, y = 31:40)

Lst4 = list(x=1:4, y = 41:44, z = 101:104)
Lst4

as.data.frame(Lst4)

#Making data frames from tables

#r mean random, pois - Poisson Distribution
p = rpois(30,1.6)
y = table(p)
y
as.data.frame(y)

#Remember that a data frame is essentialy a matrix with different variable types
# Therefore we can make a df by combining equal length vectors

x <- runif(20)
y <- letters[1:20]
z <- c(rep("A", 10),rep("B",10))
df3 = data.frame(x,y,z)

df3

with(df3, df3[z=="A",])
with(df3, df3[z=="A" & x < 0.5,])

#order data frames
with(df3, df3[order(z,y),])

#unique data
with(df3, unique(z))

#number of unique data
length(with(df3, unique(z)))

#summary of the data frame
summary(df3)

#####################
#Quiz
####################
#add into Lst
Lst[6] <- list(v=c(1,2,3))
Lst

Lst <-c(Lst,list(v=c(1,2,3)))
Lst

x4 <- 1:5
y4 <- c("a","b","c")
df4 = data.frame(x = x4, y = y4)
df4
class(df4$x)

readIn <- read.table(file.choose(),sep= ",",header=T)

class(readIn)

by(df3,df3["z"],summary)

##########################
#Assignment
##########################

library(s20x)
data(apples.df)
weights = apples.df$Weight
sort(weights)
length (which( weights < 1000))

summary(apples.df)

sd(apples.df$Weight)


length (which( apples.df$Weight < 1000 & apples.df$Rootstock == "XVI"))

length (which(apples.df$Rootstock == "XVI"))
subset(apples.df, Rootstock == c("XVI"),)

library(s20x)
data(course.df)

head(course.df)

length(which(course.df$Gender == "Female" & 
               course.df$Degree ==  "BSc" &
               course.df$Exam > 86))

passedm <- with(course.df, course.df[Pass ==  "Yes",])

by(passedm,passedm["Gender"],summary)

passed50 <- with(course.df, course.df[Gender == "Female" &
                          Pass ==  "Yes" & Exam > 50 & Repeat == "Yes",])
head(passed50)
summary(passed50)
by(passed50, fPassed50["Gender"],summary)


with(passed50, unique(Degree))
