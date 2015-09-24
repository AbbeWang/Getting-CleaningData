#Question 1
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, destfile = "./data/housing.csv")
housing = read.csv("./data/housing.csv")

agricultureLogical = housing$ACR==3 & housing$AGS==6

house_agri = housing[which(agricultureLogical),]


#Question 2
library(jpeg)
library(help = jpeg)
?readJPEG

picurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
# ?download.file(picurl, destfile = "./data/jeff.jpg")
jeff = readJPEG("./data/getdata-jeff.jpg", native = TRUE)

quantile(jeff, probs = c(0.3,0.8))


#Question 3

fileUrl1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileUrl2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(fileUrl1, destfile = "./data/product.csv")
download.file(fileUrl2, destfile = "./data/edu.csv")

product = read.csv("./data/product.csv")
edu = read.csv("./data/edu.csv")


mergedData = merge(product,edu,by.x = "X",by.y = "CountryCode",all = FALSE)

sum(!is.na(unique(mergedData$Gross.domestic.product.2012)))

mergedData$Gross.domestic.product.2012 = as.numeric(as.character(mergedData$Gross.domestic.product.2012))

mergedData = arrange(mergedData, desc(Gross.domestic.product.2012))


#Question 4
library(plyr)
ddply(mergedData, .(Income.Group), plyr::summarize, mean = mean(Gross.domestic.product.2012, na.rm = TRUE))


#Question 5
library(Hmisc)
mergedData$group = cut2(mergedData$Gross.domestic.product.2012, g=5)
tb = table(mergedData$Income.Group, mergedData$group)
tb

