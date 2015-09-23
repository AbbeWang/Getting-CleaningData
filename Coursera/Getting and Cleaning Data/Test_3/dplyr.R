library(dplyr)
chicago <- readRDS("chicago.rds")

#select
names(chicago)
head(select(chicago, city:dptp))
head(select(chicago, -(city:dptp)))

#Equivalent base R
i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])

#filter
chic.f <- filter(chicago, pm25tmean2 > 30)
head(select(chic.f, 1:3, pm25tmean2), 10)

chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
head(select(chic.f, 1:3, pm25tmean2, tmpd), 10)


#arrange
chicago <- arrange(chicago, date)
chicago <- arrange(chicago, desc(date))


#rename
head(chicago[, 1:5], 3)
chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp)


#mutate
chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))


#group_by
chicago <- mutate(chicago, tempcat = factor(1*(tmpd>80), labels = c("cold","hot")))
hotcold <- group_by(chicago, tempcat)

summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE),
          o3 = max(o3tmean2),
          no2 = median(no2tmean2))

#group by year
chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
years <- group_by(chicago, year)
summarize(years, pm25 = mean(pm25, na.rm = TRUE),
          o3 = max(o3tmean2, na.rm = TRUE),
          no2 = median(no2tmean2, na.rm = TRUE))

#(chain) pipeline operations
chicago %>% mutate(month = as.POSIXlt(date)$mon + 1) %>% group_by(month) %>% summarize(pm25 = mean(pm25, na.rm = TRUE),
              o3 = max(o3tmean2, na.rm = TRUE),
              no2 = median(no2tmean2, na.rm = TRUE))

