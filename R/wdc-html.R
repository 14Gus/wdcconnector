#' Generate the HTML front end for a WDC Tableau connector
#'
#' @description
#' For Tableau to connect to a served table in R you need to generate an HTML file.
#' This HTML file also has to be served and then accessed via the URL in Tableau.
#'
#' This HTML file also provides the user interface for users to access data.
#'
#' @param js_script_path The path to the javascript file containing your web data connector.
#'
#' @export
#' @example
#' generateWDCHTML
generateWDCHTML <- function(js_script_path){

  template <- getTemplate("WDC_template.html")

  whisker::whisker.render(template)
}
