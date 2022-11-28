#   COLEGIO DE POSTGRADUADOS
#   COMPUTO APLICADO
#   COA 501 Herramientas de Computo para Investigadores
#
#   TRABAJO FINAL

# 1. Realice un análisis de componentes principales ACP con el conjunto de datos Boston.csv adjunto
# y el script PCA proporcionado.

setwd("C:/Users/semex/Desktop/TRABAJO_FINAL_COA501")

Damage <- read.csv( file= "por_damage.csv", sep = ",")
library(skimr)

skim(Damage)
# nos muestra que tenemos 217 valores en una sola columna, los valores son numéricos 

# ── Data Summary ────────────────────────
# Values
# Name                       Damage
# Number of rows             217   
# Number of columns          1     
# _______________________          
# Column type frequency:           
#   numeric                  1     
# ________________________         
# Group variables            None  

# ── Variable type: numeric ───────────────────────────────────────────────────────────────────────────────────────────────
# skim_variable n_missing complete_rate mean   sd p0 p25 p50 p75 p100 hist 
# 1 clorosis              0             1 4.35 6.88  0 0.7 1.8 4.6 39.6 ▇▁▁▁▁


summary(Damage) # nos muestra los generales de los dátos, considerando los cuartiles, valores mínimos y máximos

# clorosis     
# Min.   : 0.000  
# 1st Qu.: 0.700  
# Median : 1.800  
# Mean   : 4.348  
# 3rd Qu.: 4.600  
# Max.   :39.600


hist(Damage$clorosis) # genera un histográma con los valores de clorosis

table(Damage) # nos muestra la frecuencia de cada una de las observaciones

library(car)
library(tibble)

df <- data_frame(Damage$clorosis)

# names (df_Damage) = c("Clorosis", "Categoria") # renombrar las columnas
# df_Damage

library(dplyr)

categoria <- ifelse(Damage$clorosis <= 1 , "Ningun efecto",Damage$clorosis)
categoria <- ifelse(categoria <= 3.5 , "sintomas muy ligeros",categoria)
categoria <- ifelse(categoria <= 7 , "sintomas ligeros",categoria)
categoria <- ifelse(categoria <= 12.5 , "sintomas evidentes",categoria)
categoria <- ifelse(categoria <= 20 , "Daño medio",categoria)
categoria <- ifelse(categoria <= 30 , "Daño elevado",categoria)
categoria <- ifelse(categoria <= 50 , "Daño muy elevado",categoria)
categoria <- ifelse(categoria <= 99 , "Daño severo",categoria)
categoria <- ifelse(categoria <= 100 , "Muerte total",categoria)
categoria

table(categoria)
# categoria
# Daño severo        Ningun efecto     sintomas ligeros sintomas muy ligeros 
# 11                   79                   39                   88 

df_cat <- data_frame(categoria)
df_Damage <- (c(df,df_cat))
df_Damage
