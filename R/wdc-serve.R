#' Generate the R file used by plumber to serve to generate the API.
#'
#' @param table_name Name of the table to be served. This should be saved in the local environment.
#'
#' @export
#' @example
#' generatePlumbedFile(mtcars)

generatePlumbedFile <- function(table_name){

  table_name <- substitute(table_name)

  template <- getTemplate("plumbed_data_template.R")

  whisker::whisker.render(template)

}

servePlumbedFile <- function(plumbed_path, port=DEFAULT_PORT){
  r <- plumber::plumb(plumbed_path)

  r$run(port=port)
}
