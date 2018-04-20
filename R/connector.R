#' @rdname generateWDCJS
#' @export
generateWDCConnectorJS <- function(table){

  table_name <- substitute(table)

  template <- getTemplate("WDC_connector_template.js")

  whisker::whisker.render(template)

}
