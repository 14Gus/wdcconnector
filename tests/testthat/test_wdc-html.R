context("WDC html file")

test_that("generate WDC html works",{
  html_test_path <- here::here("tests/test_wdchtml.html")
  js_script_path <- "path/to/wdcjs.js"

  expected <- readLines(html_test_path)

  expect_equal(expected, generateWDCHTML(js_script_path))
})
