(function () {
    var myConnector = tableau.makeConnector();

    myConnector.getSchema = function (schemaCallback) {
      var cols = [{{#cols}}{
          id: "{{col_name}}"
          dataType: {{tableau_data_type}}
      },{{/cols}}];

      var tableSchema = {
          id: "{{table_name}}"
          columns: cols
      };

      schemaCallback([tableSchema]);
    };

    myConnector.getData = function(table, doneCallback) {
    $.getJSON({{data_URL}}, function(resp) {
        var data = resp,
            tableData = [];

        // Iterate over the JSON object
        for (var i = 0, len = data.length; i < len; i++) {
            tableData.push({
                {{#cols}}
                "{{col_name}}": data[i].{{col_name}},
                {{/cols}}
            });
        }

        table.appendRows(tableData);
        doneCallback();
    });
};

    tableau.registerConnector(myConnector);
})();
