# Para llevar las estimaciones poblacionales INDEC por departamento a estimaciones por provincia según grupo de edad.

library(dplyr)
library(janitor)

Tabla_pobl_departamentos_a_provincias <- function(pob1){
  
  Tabla_poblacion <- pob1%>% select(-`...5`)%>%
    row_to_names(row_number = 1)%>%
    group_by(`Provincia / Jurisdicción`) %>% 
    mutate_if(is.character,as.numeric)%>%
    summarise(across(everything(),sum))%>%
    select(-`Código SIGEPI`,-`Departamento/Comuna/Partido`)%>%
    mutate(Total = `Todas las Edades`,
      `35-44`=`35-39`+`40-44`,
      `45-54`=`45-49`+`50-54`,
      `55-64`=`55-59`+`60-64`,
      `65-74`=`65-69`+`70-74`,
      `75 y más` = `75-79`+`80-84`+`85-89`+`90-94`+`95 y más`)%>%
    select(-`Todas las Edades`,-`35-39`,-`40-44`,-`45-49`,-`50-54`,-`55-59`,
      -`60-64`,-`65-69`,-`70-74`,-`75-79`,-`80-84`,-`85-89`,-`90-94`,-`95 y más`)%>%
    t()%>%
    as.data.frame()%>%
    row_to_names(row_number = 1)%>%
    tibble::rownames_to_column()%>%
    mutate(rowname= case_when(
      rowname == "0-4" ~ "00-04",
      rowname == "5-9" ~ "05-09",
      T~ as.character(rowname)))
  Tabla_poblacion <- Tabla_poblacion[c(1,2,3,4,5,6,7,9,10,11,12,13,8),]
  
  return(Tabla_poblacion)
}

# Ejemplo uso: 
# Poblacion_recodificada_2020 <- Tabla_pobl_departamentos_a_provincias(poblacion_2020)
# Siendo poblacion_2020 la hoja correspondiente al archivo de las estimaciones poblacionales por departamento

