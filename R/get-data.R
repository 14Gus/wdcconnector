#' @rdname generateWDCJS
#' @export
generateWDCGetDataJS <- function(table, table_name, server=LOCAL_HOST, port=DEFAULT_PORT, template= "WDC_getData_template.js"){
  col_names <- colnames(table)

  get_data_js <- lapply(col_names, generateWDCGetColumnDataJS)

  get_data_js <- paste0(get_data_js, collapse = ",\n")

  data_URL <- paste0(server, ":", port, "/", table_name)

  template <- getTemplate(template)

  whisker::whisker.render(template)

}

generateWDCGetColumnDataJS <- function(col_name){
  as.character(glue::glue('\"{col_name}": data[i].{col_name}'))
}
