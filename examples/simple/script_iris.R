# Tableau doesn't accept columns names containing full stops!
iris <- dplyr::rename(iris,
                      Sepal_Length = Sepal.Length,
                      Sepal_Width = Sepal.Width,
                      Petal_Length=Petal.Length,
                      Petal_Width=Petal.Width)

# This is the file path for the WDC js relative to the directory being server
js_wdc_server_path <- "wdcjs.js"

# This is the file path for the WDC js relative to the project folder
js_wdc_dir_path <- file.path(here::here("examples"), "simple", js_wdc_server_path)

# This is the file path for the WDC HTML file relative to the directory
html_path <- here::here("examples/simple/wdchtml.html")

plumbed_file_path <- here::here("examples/simple/plumbed_file.R")

# Create the WDC JS file
writeLines(generateWDCJS(iris), con = js_wdc_dir_path)

# Create the WDC HMTL file
writeLines(generateWDCHTML(js_wdc_server_path), html_path)

# Generate the file to be plumbed.
writeLines(generatePlumbedFile(iris), plumbed_file_path)

# Serve the file
r <- plumber::plumb(plumbed_file_path)

web_connector_html <- plumber::PlumberStatic$new("examples/simple")

r$mount("/wdc", web_connector_html)

r$run(port=8000)
