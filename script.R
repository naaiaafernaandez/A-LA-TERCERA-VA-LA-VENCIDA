#5. Cargar archivo y revisar formatos
library(readxl)
ruta_archivo <- "datos/online_retail_II.xlsx" #Pones la carpeta donde se encuentra, GRACIAS GORKA
df <- read_excel(ruta_archivo)
head(df)

str(df)
df$Quantity<- as.integer(df$Quantity)#Cantidad no puede tener decimales
df$`Customer ID`<- as.character(df$`Customer ID`)#Un ID al final lo puedes poner en caracter que es para identificar

#6. Análisis básico de las variables, en mi caso numéricas
library(dplyr)
df_numerico<- df%>%
  select_if(is.numeric)
summary(df_numerico)

#VARIABLE QUANTITY
#Cantidad mínima -9600, valor atípico, no puede haber valor negativo en cantidad de productos vendidos
#Diferencia entre percentiles y la mediana, tira más para el primer quartil, cola más larga hacia la derecha
#Maximo y mínimo tienen mucha diferencia con el valor de la mediana, por lo que hay outliers

#VARIABLE PRICE
#Maximo y mínimo tienen mucha diferencia con el valor de la mediana, por lo que hay outliers
#La mediana se acerca más al primer quartil, pero por muy poco


#7. Cuantos pedidos diferentes hay
length(unique(df$Invoice))
unique(df$Invoice)

#10.	Calcula el precio medio de producto por pedido
diez<-df%>%
  group_by(Description)%>%
  summarize(media=mean(Price))
