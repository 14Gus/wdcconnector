context("get data")

test_that("generateWDCGetData works",{
  expected <- "myConnector.getData = function(table, doneCallback) {\n  $.getJSON(\"http://127.0.0.1:8000/iris\", function(resp) {\n    var data = resp,\n    tableData = [];\n\n    // Iterate over the JSON object\n    for (var i = 0, len = data.length; i < len; i++) {\n      tableData.push({\n        \"Sepal.Length\": data[i].Sepal.Length,\n\"Sepal.Width\": data[i].Sepal.Width,\n\"Petal.Length\": data[i].Petal.Length,\n\"Petal.Width\": data[i].Petal.Width,\n\"Species\": data[i].Species\n      });\n    }\n\n    table.appendRows(tableData);\n    doneCallback();\n  });\n};"

  expect_equal(expected, generateWDCGetDataJS(iris, "iris"))

})

test_that("generateWDCGetColumnDataJS works",{
  expected <- '"new_col": data[i].new_col'

  expect_equal(expected, generateWDCGetColumnDataJS("new_col"))
})

