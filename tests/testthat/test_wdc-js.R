context("wdc js")

test_that("Generate wdc js works",{
  expected <- readLines(here::here("tests/test_wdcjs.js"))

  expect_equal(expected, generateWDCJS(iris))
})
