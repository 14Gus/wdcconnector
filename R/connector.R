#' @rdname generateWDCJS
#' @export
generateWDCConnectorJS <- function(table_name){

  template <- getTemplate("WDC_connector_template.js")

  whisker::whisker.render(template)

}
