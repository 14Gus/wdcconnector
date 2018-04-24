#' @rdname generateWDCJS
#' @export
generateWDCGetSchemaJS <- function(table, table_name, port, server, template ="WDC_getSchema_template.js"){

  cols <- generateWDCColumnsJS(table)

  schema <- generateWDCSchemaJS(table_name)

  template <- getTemplate(template)

  whisker::whisker.render(template)

}
