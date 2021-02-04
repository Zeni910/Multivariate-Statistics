library(plyr)

auto_data <- read.table("auto.txt", header=FALSE, sep="\t")
auto_data

auto_data <- rename(auto_data, c(
  "V1"="MPG",
  "V2"="Cylinders",
  "V3"="Displacement",
  "V4"="Horsepower",
  "V5"="Weight",
  "V6"="Acceleration",
  "V7"="ModelYear",
  "V8"="Origin",
  "V9"="CarName"
  ))

x <- auto_data[[3]]
mean(x)
var(x)
n <- length(x)
n

library(ggplot2)

ggplot(auto_data, aes(x=Displacement)) + geom_histogram()

ggplot(auto_data, aes(x=Displacement)) + geom_density()

ggplot(auto_data, aes(x=Displacement,y=rep(1,n))) + geom_jitter() + ylim(0,2) + ylab("Random Y")

colMeans(auto_data[,1:7], na.rm = TRUE)
cov(auto_data[,1:7], use = "na.or.complete")
cor(auto_data[,1:7], use = "na.or.complete")

ggplot(auto_data, aes(x=Displacement,y=Weight)) + geom_bin2d()

ggplot(auto_data, aes(x=Displacement,y=Weight)) + geom_hex()

ggplot(auto_data, aes(x=Displacement,y=Weight)) + geom_density_2d()

ggplot(auto_data, aes(x=Displacement,y=Weight)) + geom_point()

ggplot(auto_data, aes(x=Displacement,y=Weight)) + geom_point(aes(color=Acceleration),size=auto_data$Horsepower/50)+ ggtitle("Point Size is Proportional to Horsepower")

