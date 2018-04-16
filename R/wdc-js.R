#' Generate the javascript file required for a Tableau WDC connector to connect to an R dataframe served by the package plumber.
#'
#' @param table A valid dataframe or other table like object in R
#'
#' @export
#' @example generateWDCJS(mtcars)
#'
generateWDCJS <- function(table){

  template <- getTemplate("WDC_template.js")


  data <- list( get_schema_js = generateWDCGetSchemaJS(table)
                , get_data_js = generateWDCGetDataJS(table)
                , connector_js = generateWDCConnectorJS(table)
                )

  whisker::whisker.render(template, data)
}
