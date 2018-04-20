#' Generate the javascript for a Tableau WDC connector
#'
#' @description
#' Generate the javascript required for a Tableau WDC connector to connect to an
#' R dataframe served by the package plumber.
#'
#' In order for Tableau's web data connector to tool to connect to a served file, Tableau
#' requires a javascript file that does three things:
#'
#' - lays out a schema for the table which tells Tableau the datatypes and column names of the table
#' and the table name itself.
#'
#' - tells Tableau how to load the data from the served JSON file into a table.
#'
#' - connects interactivity on the WDC HTML page to the generation of a web data connector.
#'
#' The whole web data connector javascript file can be generated using \code{generateWDCJS}.
#' The constituent elements of the web data connector can also be generated. Using the respective
#' functions \code{generateWDCGetSchemaJS} generates the schema, \code{generateWDCGetDataJS}
#' generates the code that extracts the data from the json file, \code{generateWDCConnectorJS}
#' generates the code that connects the web data connector to interactivity on the HTML file.
#'
#' @param table A valid dataframe or other table like object in R
#'
#' @export
#' @examples
#'
#' # Generate the whole javascript file
#' generateWDCJS(mtcars)
#'
#' # Generate the GetSchema javascript for the for the mtcars file
#' generateWCGetSchemaJS(mtcars)
#'
#' # Generate the GetData javascript for the for the mtcars file
#' generateWDCGetDataJS(mtcars)
#'
#' # Generate the Connector javasript for the mtcars file
#' generateWDCConnectorJS(mtcars)
#'
generateWDCJS <- function(table){

  template <- getTemplate("WDC_template.js")


  data <- list( get_schema_js = generateWDCGetSchemaJS(table)
                , get_data_js = generateWDCGetDataJS(table)
                , connector_js = generateWDCConnectorJS(table)
                )

  whisker::whisker.render(template, data)
}
