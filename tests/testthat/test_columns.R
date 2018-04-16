context("Columns var")

test_that("columns created correctly",{
  expected <- 'var cols = [{
  id: "id",
  dataType: tableau.dataTypeEnum.string
}, {
  id: "mag",
  alias: "magnitude",
  dataType: tableau.dataTypeEnum.float
}, {
  id: "title",
  alias: "title",
  dataType: tableau.dataTypeEnum.string
}, {
  id: "location",
  dataType: tableau.dataTypeEnum.geometry
}]'

  cols <- generateWDCColumnsJS(test_table)

  expect_equal(cols, expected)
})

test_that("generates column correctly",{

  expected <- '{
  id: "id",
  dataType: tableau.dataTypeEnum.string
  }'

  col <- generateWDCColumnJS(column_name = "id",type = "character")

  expect_equal(col, expected)

})

test_that("maps R to tableau datatype",{

  expect_equal(mapRTypeToTableau("numeric"), "tableau.dataTypeEnum.float")
  expect_equal(mapRTypeToTableau("character"), "tableau.dataTypeEnum.string")
  expect_equal(mapRTypeToTableau("logical"), "tableau.dataTypeEnum.bool")
  expect_equal(mapRTypeToTableau("date"), "tableau.dataTypeEnum.date")
  expect_equal(mapRTypeToTableau("integer"), "tableau.dataTypeEnum.int")
  expect_equal(mapRTypeToTableau("factor"), "tableau.dataTypeEnum.string")
  expect_equal(mapRTypeToTableau("double"), "tableau.dataTypeEnum.float")

})

