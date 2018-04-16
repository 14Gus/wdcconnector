generateWDCGetDataJS <- function(table){
  col_names <- colnames(table)

  get_data_js <- lapply(col_names, generateWDCGetColumnDataJS)

  get_data_js <- paste0(get_data_js, collapse = ",\n")

  data_URL <- "http://127.0.0.1:8000/data"

  template <- getTemplate("WDC_getData_template.js")

  whisker::whisker.render(template)

}

generateWDCGetColumnDataJS <- function(col_name){
  as.character(glue::glue('\"{col_name}": data[i].{col_name}'))
}
