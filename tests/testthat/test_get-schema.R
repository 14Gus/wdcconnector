context("get schema")

test_that("generateWDCGetSchemaJS works",{

  expected <- "myConnector.getSchema = function (schemaCallback) {\n\n  var cols = [{\nid: \"Sepal.Length\",\ncolumnType: tableau.columnRoleEnum.measure,\ndataType: tableau.dataTypeEnum.float\n},{\nid: \"Sepal.Width\",\ncolumnType: tableau.columnRoleEnum.measure,\ndataType: tableau.dataTypeEnum.float\n},{\nid: \"Petal.Length\",\ncolumnType: tableau.columnRoleEnum.measure,\ndataType: tableau.dataTypeEnum.float\n},{\nid: \"Petal.Width\",\ncolumnType: tableau.columnRoleEnum.measure,\ndataType: tableau.dataTypeEnum.float\n},{\nid: \"Species\",\ncolumnType: tableau.columnRoleEnum.dimension,\ndataType: tableau.dataTypeEnum.string\n}];\n\n  var tableSchema = {\nid: \"iris\",\ncolumns: cols\n};\n\n  schemaCallback([tableSchema]);\n};"

  expect_equal(expected, generateWDCGetSchemaJS(iris))

})
