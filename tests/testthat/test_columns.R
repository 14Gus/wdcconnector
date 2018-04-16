context("Columns var")

test_that("columns created correctly",{
  expected <- "var cols = [{\nid: \"Sepal.Length\",\ndataType: tableau.dataTypeEnum.float\n},{\nid: \"Sepal.Width\",\ndataType: tableau.dataTypeEnum.float\n},{\nid: \"Petal.Length\",\ndataType: tableau.dataTypeEnum.float\n},{\nid: \"Petal.Width\",\ndataType: tableau.dataTypeEnum.float\n},{\nid: \"Species\",\ndataType: tableau.dataTypeEnum.string\n}]"

  cols <- generateWDCColumnsJS(iris)

  expect_equal(cols, expected)
})

test_that("generates column correctly",{

  expected <- "{\nid: \"id\",\ndataType: tableau.dataTypeEnum.string\n}"

  col <- generateWDCColumnJS(column_name = "id",type = "character")

  expect_equal(col, expected)

})

test_that("maps R to tableau datatype",{

  expect_equal(mapRTypeToTableau("numeric"), "float")
  expect_equal(mapRTypeToTableau("character"), "string")
  expect_equal(mapRTypeToTableau("logical"), "bool")
  expect_equal(mapRTypeToTableau("date"), "date")
  expect_equal(mapRTypeToTableau("integer"), "int")
  expect_equal(mapRTypeToTableau("factor"), "string")
  expect_equal(mapRTypeToTableau("double"), "float")

})

