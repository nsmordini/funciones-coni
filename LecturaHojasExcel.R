# Función para leer todas las hojas de un archivo de excel.

library(readxl)

lectura_hojas <- function(archivo, tibble = FALSE) { 
  hojas <- readxl::excel_sheets(archivo) 
  x <- lapply(hojas, function(X) readxl::read_excel(archivo, sheet = X)) 
  if(!tibble) x <- lapply(x, as.data.frame) 
  names(x) <- hojas 
  return(x)
}

# Ejemplo uso de la función:
# hojas <- lectura_hojas("H:/2022/Estimaciones Departamentos Edad y Sexo 2001-2022.xlsx") 
# Se va a generar una lista que contiene cada una de las hojas del excel.
# 
# Para ver el nombre de cada hoja: 
# View(hojas)
#
# Ejemplo de cómo usar una hoja en particular:
# poblacion_2019 <-hojas[["Ambos Sexos 2019"]] 
#
# Después de guardar las hojas de interés en el enviroment, eliminar el resto para liberar espacio:
# rm(mysheets)
