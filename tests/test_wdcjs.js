(function () {
    var myConnector = tableau.makeConnector();

    myConnector.getSchema = function (schemaCallback) {

  var cols = [{
id: "mpg",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
},{
id: "cyl",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
},{
id: "disp",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
},{
id: "hp",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
},{
id: "drat",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
},{
id: "wt",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
},{
id: "qsec",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
},{
id: "vs",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
},{
id: "am",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
},{
id: "gear",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
},{
id: "carb",
columnType: tableau.columnRoleEnum.measure,
dataType: tableau.dataTypeEnum.float
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
        "mpg": data[i].mpg,
"cyl": data[i].cyl,
"disp": data[i].disp,
"hp": data[i].hp,
"drat": data[i].drat,
"wt": data[i].wt,
"qsec": data[i].qsec,
"vs": data[i].vs,
"am": data[i].am,
"gear": data[i].gear,
"carb": data[i].carb
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
