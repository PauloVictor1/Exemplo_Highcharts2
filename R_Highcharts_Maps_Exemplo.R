#################################################################################################################################
#################### Todos os exemplos abaixo vem do site da medium #############################################################
#disponível em: https://medium.com/appsilon-data-science/r-highcharts-how-to-make-interactive-maps-for-r-and-r-shiny-8732b6e49ab1
#############################################################################################################################




library(highcharter)
library(dplyr)


airports <- read.csv("~/Documents/GitHub/Exemplo_Highcharts2/airports.csv", sep=";")
airports <- na.omit(airports)

head(airports)

# Codigo para pegar o Brasil (Notei que Fernando de Noronha nao entrou)
# hcmap("countries/br/br-all", showInLegend = FALSE)

# Pegando os EUA
hcmap("countries/us/us-all", showInLegend = FALSE) |>
  hc_title(text = "United States of America") |>
  hc_subtitle(text = "Airports in the USA")

# Criando a contagem de aeroportos por estado americano
count_by_state <- airports %>%
  count(STATE, sort = TRUE)

head(count_by_state)

# Passando os valores de contagem criados para dentro do mapa 
# Note que a variavel - ou coluna - "State" tem o mesmo nome
# dentro de ambas as bases

hcmap(
  "countries/us/us-all",
  showInLegend = FALSE,
  data = count_by_state,
  value = "n",
  name = "State"
) |>
  hc_title(text = "United States of America") |>
  hc_subtitle(text = "Airports in the USA")

# Enriquecendo o mapa: 

# The above results are fine, and you can even see the counts when you hover 
# over individual states.
# But let’s kick things up a notch. We now want to display state names and draw
# a distinct line between individual states. This will further enrich the end 
# result and will eliminate all the guesswork from the final user.

# The `dataLabels`,`borderColor`, and `borderWidth` parameters are what you’re looking for.
# The last two are intuitive to understand, but the first needs some explanation. 
# Here, you first need to enable labels and then specify what you want to see on it. 
# Passing in `{point.name}` will return the name of the state in this case:


hcmap(
  "countries/us/us-all",
  showInLegend = FALSE,
  data = count_by_state,
  value = "n",
  name = "State",
  dataLabels = list(enabled = TRUE, format = "{point.name}"),
  borderColor = "#000000",
  borderWidth = 0.5,
  tooltip = list(
    valueSuffix = " airport(s)"
  )
) |>
  hc_title(text = "United States of America") |>
  hc_subtitle(text = "Airports in the USA")

