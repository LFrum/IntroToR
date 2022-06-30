#Intro to R
#Unit 5 Lecture
#18 November 2020

#########################
# Lecture
#########################

ddt
head(ddt)
with(ddt, boxplot(LENGTH~SPECIES))

tab =table(ddt$RIVER)
tab
windows() #in MAC use quartz()
pie(tab)
barplot(tab)
#LENGTH is y-axis - quantitative
#SPECIES is x-axis - qualitative
with(ddt,boxplot(LENGTH~SPECIES))

plot(LENGTH~SPECIES, data = ddt)

#########################
# ASSIGNMENT
#########################

library(s20x)
data(course.df)

head(course.df)

tab = table(course.df$Degree)

with(course.df, boxplot(Exam~Degree))

plot(Exam ~ Test, data=course.df)

tabAttend =table(course.df$Attend)
tabAttend

tabDegree =table(course.df$Degree)
tabDegree


length(which(course.df$Attend == "No" & 
               course.df$Degree ==  "BSc"))

#if plotted, Degree is y-axis, Stage1 is x-axis
tabDS = with(course.df, table(Degree,Stage1))
barplot(tabDS, beside=TRUE, legend = TRUE)

#if plotted, Stage1 is y-axis, Degree is x-axis
tabSD = with(course.df, table(Stage1,Degree))
barplot(tabSD, beside=TRUE, legend = TRUE,
        col=c("red","blue","green"))

