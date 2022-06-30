#9 December 2020
#Intro to R
#Unit 8

library (ggplot2)

windows()

#SCATTER PLOT
s = ddt %>% ggplot(aes(x=WEIGHT, y = LENGTH, col=SPECIES))

s = s + geom_point()

s

s = s + geom_smooth(methond="lm", se = TRUE, formula = y~x + I(x^2))

s = s + ggtitle("Scatterplot")

s

#BOX PLOT

b = ggplot(ddt, aes(x=SPECIES, y=LENGTH))

b = b + geom_boxplot()

b

# adjust for RIVER
b = ggplot(ddt, aes(x=SPECIES, y = LENGTH, fill = RIVER))

b = b + geom_boxplot()

b

b = ggplot(ddt, aes(x=SPECIES, y=LENGTH, fill = "SPECIES"))

b = b + geom_boxplot()

b= b + facet_grid(.~RIVER)

b
# NEXT

b = ggplot(ddt, aes(x=SPECIES, y=LENGTH))

b = b + geom_boxplot()

b= b + facet_grid(.~RIVER)

b

# NEXT


#NEXT
# https://colorbrewer2.org - nice colors

b = ggplot(ddt, aes(x=SPECIES, y=LENGTH, fill = "SPECIES"))

b = b + geom_boxplot()

b= b + facet_grid(.~RIVER)

b= b + scale_fill_manual(value=c("#ffeda0","#feb24c", "#f03b20"))

b

#background
b + theme_bw()

#violin plots
v = ggplot(ddt, aes(x=SPECIES, y=LENGTH, fill=SPECIES))

v = v + geom_violin()

v = v + facet_grid(.~RIVER)

v = v + scale_fill_manual(value=c("#ffeda0","#feb24c", "#f03b20"))

#histogram
h = ggplot(ddt, aes(x=WEIGHT, fill=..density..))

h = h + geom_histogram(aes(y=..density..))

h = h + scale_fill_gradient("density", low="green", high="red")

h = h + theme_dark()

h

#add facets according to RIVER horizontally

h = h + facet_grid(RIVER~.)

#pie chart
p = gggplot(ddt.aes(x="", fill=SPECIES)) + geom_bar()
p #preview

p = p + coord_polar(theta="y") + scale_x_discrete("")

p + facet_grid  (.~RIVER)

#bar plot
bar = ggplot(ddt, aes(x=RIVER, fill=RIVER))
bar = bar + geom_bar()
bar

bar = bar + facet_grid(.~SPECIES)

# 2-D contour plots
c = ggplot(ddt, aes(x=LENGTH, y=WEIGHT))

c = c + geom_density2d()

c

#use a statistic to fill
c = ggplot(ddt, aes(x=LENGTH, y=WEIGHT))
#n number of grid points
c = c + stat_density_2d(aes(fill=..level..),geom="polygon", n = 100)

c = c + geom_point(col="red")
?geom_point
##############################
#dplyr
##############################
#There are a number of verbs we can use to manipulate data frames
#filter() (and slice())
#arrange()
#select() (and rename())
#distinct()
#mutate() (and transmute())
#summarise
#sample_n (and sample_frac())


library(dplyr)

help(package="dplyr")
browseVignettes(package="dplyr")


#filter rows
filter(ddt, LENGTH > 50, DDT >80)

#same without the package
ddt [ddt$LENGTH > 50 & ddt$DDT >80,]

filter(ddt,RIVER=="FCM", WEIGHT > 1000)
#can do BOOLEAN
filter(ddt, SPECIES =="CATFISH" | SPECIES == "LMBASS")
#sort 
arrage(ddt, DDT)

#descending order
arrange(ddt,desc(DDT))

#
catf=filter(ddt, SPECIES=="CATFISH" | SPECIES == "LMBASS")

arrange(catf,SPECIES)

# or we can use "PIPE" %>%

filter(ddt, SPECIES == "CATFISH" | SPECIES == "LMBASS") %>% arrange(SPECIES)

# select column
select(ddt, LENGTH, WEIGHT)

#distinct value
distinct(select(ddt,LENGTH))
#or use pipe
select(ddt,LENGTH)%>% distinct()

#rename
rename(ddt, L=LENGTH, W=WEIGHT)

#use it all together
filter(ddt, SPECIES == "CATFISH" | SPECIES == "LMBASS") %>% arrange(SPECIES) %>% select(LENGTH, WEIGHT, SPECIES)

#slice rows by position

slice(ddt,c(1,4)) #take row 1 and row 4
slice(ddt, 1:10) #take row 1 to 10

#we can add new columns using mutate
mutate(ddt, LW=LENGTH*WEIGHT)

#use var you have just made
mutate(ddt, LW=LENGTH*WEIGHT, LWD=LW*DDT)

#the original df is the same
#keep new variable use transmute()

ddt
transmutate(ddt, LW=LENGTH*WEIGHT, LWD=LW*DDT)

#summarise() collapse a df to a single row

summarise(ddt,mean(DDT))

summarise(ddt,
          mw=mean(WEIGHT),
          ml=mean(LENGTH),
          iqrddt=IQR(DDT)
)

#take a random sample of the rows
sample_n(ddt, 20)

sample_frac(ddt, 0.30) # both done with replacement

#Problem 
# find mean, sd , iqr of DDT in catfish caught
# 5 miles in from the tennessee river mouth
# we will chaining

ddt %>% filter(SPECIES=="CATFISH", MILE == 5) %>% summarise(mn=mean(DDT), sd=sd(DDT), iqr= IQR(DDT))

###################
# Quiz
###################
install.packages("nycflights13")
library(nycflights13)
dim(flights)
head(flights)

library(ggplot2)

f_temp <- flights

rename(f_temp, tail_num = tailnum)
summary(f_temp)

f_temp %>% 
  group_by(year,month,day) %>% 
  select(arr_delay,dep_delay)

###################
# Assignment
###################

library(nycflights13)
dim(flights)
head(flights)
library(ggplot2)
library(dplyr)

flights %>% filter( air_time > 60 & distance > 4900) %>% 
  select(carrier) %>% table

flights %>% filter( distance  <  500) %>% select(carrier) %>% table

flights %>% filter( dest == "LAX") %>% select(carrier)  %>% 
  ggplot(aes(carrier)) + geom_bar()

by_tailnum <- group_by(flights, tailnum)
delay <- summarise(by_tailnum,
                   count = n(),# AAAAA
                   airtime = mean(air_time, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE))
delay #check what var "count" is counting for question AAAAA

delay <- filter(delay, count >  20, airtime < 100)

ggplot(delay, aes(airtime, delay)) +
  geom_point(aes(size = count), alpha = 1/2) +
  geom_smooth()# BBBBB
  scale_size_area()