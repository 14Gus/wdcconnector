myConnector.getData = function(table, doneCallback) {
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
};
