#Learning Baltimore Restaurant data

if(!file.exists("./data")){
  dir.create("./data")
}

fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/restaurant.csv")
restData <- read.csv("./data/restaurant.csv")


#UCBAdata association
data("UCBAdmissions")
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs
xt <- xtabs(Freq~Gender+Admit,data=DF)


#more variables
warpbreaks$replicate <- rep(1:9, len=54)
xt = xtabs(breaks~.,data=warpbreaks)
ftable(xt)


#printout variable size
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units = "Mb")