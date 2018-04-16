context("WDC html file")

test_that("genearte WDC html works"{
  html_test_path <- "tests/test_wdchtml.html"
  js_script_path <- "path/to/wdcjs.js"

  expected_equal(readLines(html_test_path), generateWDCHTML(js_script_path))
})
