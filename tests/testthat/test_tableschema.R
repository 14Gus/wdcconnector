context("table schema var")

test_that("generates schema correctly",{
  expected <-  "var tableSchema = {\nid: \"iris\",\ncolumns: cols\n}"

  test_schema <- generateWDCSchemaJS("iris")

  expect_equal(test_schema, expected)


})
