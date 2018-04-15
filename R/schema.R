SCHEMA_PREFIX <- "var tableSchema = "

generateWDCSchemaJS <- function(table) {
  table_name <- substitute(table)

  table_schema <- glue::glue('id: \"{table_name}\",\ncolumns: cols')

  table_schema <- addBraces(bracketNewLines(table_schema))

  paste0(SCHEMA_PREFIX, table_schema)
}

