context("table schema var")

test_that("generates schema correctly",{
  expected <-  'var tableSchema = {
    id: "earthquakeFeed",
    alias: "Earthquakes with magnitude greater than 4.5 in the last seven days",
    columns: cols
  }'

  test_schema <- generateWDCSchemaJS(test_table)

  expect_equal(test_schema, expected)
})
