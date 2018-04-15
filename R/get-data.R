
GET_DATA_TEMPLATE <- 'myConnector.getData = function(table, doneCallback) {
  $.getJSON("{{data_URL}}", function(resp) {
    var data = resp,
    tableData = [];

    // Iterate over the JSON object
    for (var i = 0, len = data.length; i < len; i++) {
      tableData.push({
        {{{get_data_js}}}
      });
    }

    table.appendRows(tableData);
    doneCallback();
  });
};'

generateWDCGetDataJS <- function(table){
  col_names <- colnames(table)

  get_data_js <- lapply(col_names, generateWDCGetColumnDataJS)

  get_data_js <- paste0(get_data_js, collapse = ",\n")

  data_URL <- "http://127.0.0.1:8000/data"

  whisker::whisker.render(GET_DATA_TEMPLATE)

}

generateWDCGetColumnDataJS <- function(col_name){
  glue::glue('\"{col_name}": data[i].{col_name}')
}
