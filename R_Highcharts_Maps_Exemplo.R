library(highcharter)
library(dplyr)


airports <- read.csv("~/Documents/GitHub/Exemplo_Highcharts2/airports.csv", sep=";")
airports <- na.omit(airports)

head(airports)