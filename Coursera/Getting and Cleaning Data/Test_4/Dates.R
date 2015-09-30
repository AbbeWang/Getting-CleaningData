d1 = date()
d1
class(d1)

d2 = Sys.Date()
d2
class(d2)

#formatting dates
format(d2, "%a %b %d")

#creating dates
x = c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
z = as.Date(x, "%d%b%Y")
z

z[1] - z[2]
as.numeric(z[1]-z[2])

#Converting to Julian
weekdays(d2)
months(d2)
julian(d2)


#lubridate
library(lubridate)
ymd("20141016")
mdy("08/04/2013")
dmy("03-04-2013")

#dealing with times
ymd_hms("2013-08-03 10:15:03")
ymd_hms("2013-08-03 10:15:03", tz="Pacific/Auckland")
?Sys.timezone

#different syntax
x = dmy("1jan1960", "2jan1960", "31mar1960", "30jul1960")
wday(x[1])
wday(x[1],label = TRUE)

