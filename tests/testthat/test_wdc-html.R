context("WDC html file")

test_that("generate WDC html works",{
  html_test_path <- here::here("tests/test_wdchtml.html")
  js_script_path <- "test_wdcjs.js"

  expected <- readChar(html_test_path, file.info(html_test_path)$size)

  # White space characters mean nothing for HTML docs
  expected <- removeWhiteSpace(expected)

  actual <- removeWhiteSpace(generateWDCHTML(js_script_path))

  expect_equal(expected, actual)
})
