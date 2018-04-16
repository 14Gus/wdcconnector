TABLEAU_TYPE_ENUM_BASE <- "tableau.dataTypeEnum."
TABLEAU_COLUMN_ROLE_ENUM_BASE <- "tableau.columnRoleEnum."

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

  tableau_column_role_enum <- generateTableauColumnRoleEnum(type)

  out <- glue::glue('id: "{column_name}",
  columnType: {tableau_column_role_enum},
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

generateTableauColumnRoleEnum <- function(r_type){

  tableau_type <- mapRTypeToTableauRoleType(r_type)

  paste0(TABLEAU_COLUMN_ROLE_ENUM_BASE, tableau_type)

}

mapRTypeToTableauRoleType <- function(r_type){

  switch(r_type,
         "character" = "dimension"
         , "factor" = "dimension"
         , "measure"
  )
}


