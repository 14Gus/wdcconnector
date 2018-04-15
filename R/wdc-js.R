#' Generate the javascript file required for a Tableau WDC connector to connect to an R dataframe served by the package plumber.
#'
#' @param table A valid dataframe or other table like object in R
#' @param con A file connection. By default prints to standard out
#'
#' @export
#' @example generateWDCJS(mtcars)
#'
generateWDCJS <- function(table, con=stdout()){

  template <- readLines("templates/WDC_template.js")


  data <- list( get_schema_js = generateWDCGetSchemaJS(table)
                , get_data_js = generateWDCGetDataJS(table)
                )

  writeLines(whisker::whisker.render(template, data), con = con)
}
