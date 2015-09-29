if(!file.exists("./data")){
  dir.create("./data")
}

fileUrl = "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.csv")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)

#fixing character vectors
tolower(names(cameraData))
splitNames = strsplit(names(cameraData), "\\.")
splitNames[[5]]
splitNames[[6]]

#lists
mylist <- list(letters=c("A","b","c"), numbers=1:3, matrix(1:25,ncol = 5))
head(mylist)

mylist[1]
mylist$letters
mylist[[1]]

#sapply()
splitNames[[6]][1]
firstElement <- function(x){
  x[1]
}
sapply(splitNames, firstElement)


#peer review data
fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1, destfile = "./data/reviews.csv")
download.file(fileUrl2, destfile = "./data/solutions.csv")
reviews <- read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)

#sub()
names(reviews)
sub("_", "", names(reviews))

#gsub()
testName <- "this_is_a_test"
sub("_","",testName)
gsub("_","",testName)


#finding values - grep(),frepl()
grep("Alameda",cameraData$intersection)
table(grepl("Alameda",cameraData$intersection))
cameraData2 <- cameraData[!grepl("Alameda",cameraData$intersection),]

grep("Alameda",cameraData$intersection, value = TRUE)
grep("Jeffstreet", cameraData$intersection)
length(grep("Jeffstreet", cameraData$intersection))


#more
library(stringr)
nchar("Jeffrey Leek")
substr("Jeffrey Leek", 1,7)
paste("Jeffrey", "Leek")
paste0("Jeffrey","Leek")
str_trim("Jeff      ")



