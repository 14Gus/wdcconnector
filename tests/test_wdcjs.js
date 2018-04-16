(function () {
    var myConnector = tableau.makeConnector();

    myConnector.getSchema = function (schemaCallback) {

  var cols = [{
id: "Sepal_Length",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
},{
id: "Sepal_Width",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
},{
id: "Petal_Length",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
},{
id: "Petal_Width",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
},{
id: "Species",
columnType: tableau.columnRoleEnum.dimension,
dataType: tableau.dataTypeEnum.string
}];

  var tableSchema = {
id: "table",
columns: cols
};

  schemaCallback([tableSchema]);
};

    myConnector.getData = function(table, doneCallback) {
  $.getJSON("http://127.0.0.1:8000/data", function(resp) {
    var data = resp,
    tableData = [];

    // Iterate over the JSON object
    for (var i = 0, len = data.length; i < len; i++) {
      tableData.push({
        "Sepal_Length": data[i].Sepal_Length,
"Sepal_Width": data[i].Sepal_Width,
"Petal_Length": data[i].Petal_Length,
"Petal_Width": data[i].Petal_Width,
"Species": data[i].Species
      });
    }

    table.appendRows(tableData);
    doneCallback();
  });
};

    tableau.registerConnector(myConnector);
      $(document).ready(function () {
  $("#submitButton").click(function () {
    tableau.connectionName ="table Table Feed";
    tableau.submit();
  });
});

})();
