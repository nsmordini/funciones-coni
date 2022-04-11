# Cuidado con CABA! Puede llegar a estar como "Ciudad de Buenos Aires"... en ese caso, cambiarlo

funcion_provincias <- function(base,colBase,colTabla) {
  
  Provincias <- data.frame(
    "Nombre" = c("Buenos Aires","CABA","Catamarca","Chaco","Chubut","Córdoba","Corrientes",
      "Entre Ríos","Formosa","Jujuy","La Pampa","La Rioja","Mendoza","Misiones",
      "Neuquén","Río Negro",
      "Salta","San Juan","San Luis",
      "Santa Cruz","Santa Fe","Santiago del Estero",
      "Tierra del Fuego","Tucumán"), 
    "Nombre_corto" = c("BUE","CABA","CAT","CHA","CHU","CBA","COR",
      "ENR","FOR","JUJ","LAP","LAR","MEN","MIS",
      "NEU","RNO",
      "SAL","SJU","SLU",
      "STU","SFE","SGO",
      "TFU","TUC"), 
    "Numero_numeric" = c(06,02,10,22,26,14,18,30,34,38,42,46,50,54,58,62,66,70,74,78,82,86,90,94),
    "Numero_character" = c("06","02","10","22","26","14","18","30","34","38","42","46","50","54","58","62","66","70","74","78","82","86","90","94")
  )
  
  colBase <- enquo(colBase)
  colTabla <- enquo(colTabla)
  
  by <- setNames(quo_name(colTabla), quo_name(colBase))
  
  outputdata <- left_join(base, Provincias, by = by)
  
  return(outputdata)
  
}

# Pasar como argumentos: 
#   El dataframe sobre el cuál queremos hacer la recodificación de las provincias
#   La columna que contiene las provincias en ese dataFrame
#   La forma en que se encuentra la provincia en el dataframe:
#       - Nombre: ej, "Buenos Aires"
#       - Nombre_corto: ej, "BUE"
#       - Numero_numeric: ej, 6
#       - Numero_character: ej, "06"  


# EJEMPLO:
# prueba <- c("Salta","San Juan","San Luis")%>% as.data.frame()
# colnames(prueba) <- "prov" 
# aver <- funcion_provincias(prueba,prov,Nombre)
