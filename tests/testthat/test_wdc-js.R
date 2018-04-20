context("wdc js")

test_that("Generate wdc js works",{

  js_test_file_path <- here::here("tests/test_wdcjs.js")

  expected <- removeCRLF(readChar(js_test_file_path, file.info(js_test_file_path)$size))

  actual <- removeCRLF(generateWDCJS(mtcars))

  expect_equal(expected, actual)
})
