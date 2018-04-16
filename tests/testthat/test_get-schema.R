context("get schema")

test_that("generateWDCGetSchemaJS works",{

  expected <- "myConnector.getSchema = function (schemaCallback) {\n\n  var cols = [{\nid: \"Sepal.Length\",\ndataType: tableau.dataTypeEnum.float\n},{\nid: \"Sepal.Width\",\ndataType: tableau.dataTypeEnum.float\n},{\nid: \"Petal.Length\",\ndataType: tableau.dataTypeEnum.float\n},{\nid: \"Petal.Width\",\ndataType: tableau.dataTypeEnum.float\n},{\nid: \"Species\",\ndataType: tableau.dataTypeEnum.string\n}];\n\n  var tableSchema = {\nid: \"iris\",\ncolumns: cols\n};\n\n  schemaCallback([tableSchema]);\n};"

  expect_equal(expected, generateWDCGetSchemaJS(iris))

})
