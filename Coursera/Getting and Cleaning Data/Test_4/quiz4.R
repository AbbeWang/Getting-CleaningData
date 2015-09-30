#Question 1
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, destfile = "./data/housing.csv")
house <- read.csv("./data/housing.csv")

splitNames = strsplit(names(house), "wgtp")
splitNames[123]


#Question 2
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url,destfile = "./data/product.csv")
product <- read.csv("./data/product.csv")

product = product[5:194,]
class(product$X.3)
product$X.3 = as.character(product$X.3)
class(product$X.3)

product$X.3 = gsub(",","",product$X.3)
mean(as.numeric(product$X.3))


#Question 3
library(dplyr)
product=rename(product, countryNames = X.2)
grep("^United", product$countryNames)


#Question 4
url1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url1,destfile = "./data/product.csv")
product <- read.csv("./data/product.csv")

url2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url2, destfile = "./data/edu.csv")
edu <- read.csv("./data/edu.csv")

a = grep("[Ff]iscal year end(.*)[Jj]une", edu$Special.Notes, value = TRUE)
a


#Question 5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
table(year(sampleTimes))

sample2012 = sampleTimes[year(sampleTimes) == 2012]
table(weekdays(sample2012))


