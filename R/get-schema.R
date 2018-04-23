#' @rdname generateWDCJS
#' @export
generateWDCGetSchemaJS <- function(table){

  cols <- generateWDCColumnsJS(table)

  schema <- generateWDCSchemaJS(table)

  template <- getTemplate("WDC_getSchema_template.js")

  whisker::whisker.render(template)

}
