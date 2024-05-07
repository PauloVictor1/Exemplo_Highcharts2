library(highcharter)
library(dplyr)


airports <- read.csv("~/Desktop/Repositorio_Git_Doc/Exemplo_ Highcharts/airports.csv", sep=";")
airports <- na.omit(airports)

head(airports)