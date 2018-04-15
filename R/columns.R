TABLEAU_TYPE_ENUM_BASE <- "tableau.dataTypeEnum."
COLS_PREFIX <- "var cols = "


generateWDCColumnsJS <- function(table){
  types <- sapply(table, class)

  col_names <- colnames(table)

  cols <- mapply(generateWDCColumnJS, col_names, types)

  cols <- addSquareBrackets(paste0(cols, collapse = ","))

  paste0(COLS_PREFIX, cols)
}


generateWDCColumnJS <- function(column_name, type){

  tableau_type_enum <- generateTableauTypeEnum(type)

  out <- glue::glue('id: "{column_name}",
  dataType: {tableau_type_enum}')

  addBraces(bracketNewLines(out))

}

generateTableauTypeEnum <- function(r_type){

  tableau_type <- mapRTypeToTableau(r_type)

  paste0(TABLEAU_TYPE_ENUM_BASE, tableau_type)

}

mapRTypeToTableau <- function(r_type){

  switch(r_type
         ,"numeric" = "float"
         ,"date" = "date"
         ,"character" = "string"
         ,"factor" = "string"
         ,"logical" = "bool"
         ,"double" = "float"
         ,"integer" = "int"
         ,"single" = "float"
         , stop(glue::glue("No corresponding tableau type found for {r_type}"))
         )

}


