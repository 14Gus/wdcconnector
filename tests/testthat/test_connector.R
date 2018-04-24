context("connector")


test_that("Generate WDC connector works",{
  expected <- "$(document).ready(function () {\n  $(\"#submitButton\").click(function () {\n    tableau.connectionName =\"iris Table Feed\";\n    tableau.submit();\n  });\n});"

  actual <- generateWDCConnectorJS("iris")

  expect_equal(expected, actual)

})
