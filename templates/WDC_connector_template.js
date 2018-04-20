$(document).ready(function () {
  $("#submitButton").click(function () {
    tableau.connectionName ="{{table_name}} Table Feed";
    tableau.submit();
  });
});
