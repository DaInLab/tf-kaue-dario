# Instalando biblioteca readxl para importar para o R arquivos com extensão .xls ou .xlsx.
if (!("readxl") %in% installed.packages()) install.packages("readxl")

# Carregando a biblioteca
library(readxl)
covid_19_bauru_mortes <- read_excel("./dados/covid_19_bauru_mortes.xlsx")

priv <- length(covid_19_bauru_mortes$tipo_hosp[which(covid_19_bauru_mortes$tipo_hosp=="privado")])

pub <- length(covid_19_bauru_mortes$tipo_hosp[which(covid_19_bauru_mortes$tipo_hosp=="público")])

unique(pub)
unique(priv)

dados <- table(covid_19_bauru_mortes$tipo_hosp)

barplot(dados, main="Número de Mortes de por Tipo de Hospitais em Bauru", xlab = "Tipo de hospitais", ylab = "Total")

covid_19_bauru_mortes$inicio_sintoma <- as.Date(covid_19_bauru_mortes$inicio_sintoma)
covid_19_bauru_mortes$data_obito <- as.Date(covid_19_bauru_mortes$data_obito)

covid_19_bauru_mortes[["tempo"]] <- difftime(covid_19_bauru_mortes$data_obito, covid_19_bauru_mortes$inicio_sintoma, units = "days")

covid_19_bauru_mortes[["tempo"]]