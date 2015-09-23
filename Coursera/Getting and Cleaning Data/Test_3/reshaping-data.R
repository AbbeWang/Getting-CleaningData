library(reshape2)
head(mtcars)

#Melting data frames
mtcars$carname = rownames(mtcars)
#tall and skinny
carMelt = melt(mtcars, id=c("carname","gear","cyl"), measure.vars = c("mpg","hp"))

tail(carMelt,n=3)


#Casting data frames
cylData <- dcast(carMelt,cyl~variable)
cylData

cylData <- dcast(carMelt,cyl~variable,mean)
cylData


#Averaging values
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)


#Another way-split, apply, combine
spIns = split(InsectSprays$count, InsectSprays$spray)
spIns

sprCount = lapply(spIns, sum)
sprCount
unlist(sprCount)

#or:
sapply(spIns, sum)


#Another way - plyr package
library(plyr)
ddply(InsectSprays, .(spray), plyr::summarize, sum=sum(count))

#creating a new variable
spraySums = ddply(InsectSprays, .(spray), plyr::summarize, sum=ave(count, FUN = sum))
dim(spraySums)


#function summarize is in two packages: plyr and Hmisc, here uses plyr.
