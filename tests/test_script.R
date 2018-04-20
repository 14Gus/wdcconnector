
js_path <- "test_wdcjs.js"

html_path <- "tests/test_wdchtml.html"

js_full_path <- file.path("tests", js_path)

iris <- dplyr::rename(iris,
              Sepal_Length = Sepal.Length,
              Sepal_Width = Sepal.Width,
              Petal_Length=Petal.Length,
              Petal_Width=Petal.Width)

# Create the WDC JS file
writeLines(generateWDCJS(mtcars),con = js_full_path)
# Create the WDC HMTL file
writeLines(generateWDCHTML(js_path),html_path)

# Generate the plumbed file

# Generate the server file

# Serve the file
source("tests/test_plumb.R")
