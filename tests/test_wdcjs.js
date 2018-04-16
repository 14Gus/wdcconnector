(function () {
    var myConnector = tableau.makeConnector();

    myConnector.getSchema = function (schemaCallback) {

  var cols = [{
id: "Sepal.Length",
dataType: tableau.dataTypeEnum.float
},{
id: "Sepal.Width",
dataType: tableau.dataTypeEnum.float
},{
id: "Petal.Length",
dataType: tableau.dataTypeEnum.float
},{
id: "Petal.Width",
dataType: tableau.dataTypeEnum.float
},{
id: "Species",
dataType: tableau.dataTypeEnum.string
}];

  var tableSchema = {
id: "iris",
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
        "Sepal.Length": data[i].Sepal.Length,
"Sepal.Width": data[i].Sepal.Width,
"Petal.Length": data[i].Petal.Length,
"Petal.Width": data[i].Petal.Width,
"Species": data[i].Species
      });
    }

    table.appendRows(tableData);
    doneCallback();
  });
};

    tableau.registerConnector(myConnector);
})();
