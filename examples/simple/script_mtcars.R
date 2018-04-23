# This is the file path for the WDC js relative to the directory being server
js_path <- "wdcjs.js"

# This is the file path for the WDC js relative to the project folder
js_full_path <- file.path(here::here("examples"), "simple", js_path)

# This is the file path for the WDC HTML file relative to the directory
html_path <- here::here("examples/simple/wdchtml.html")

plumbed_file_path <- here::here("examples/simple/plumbed_file.R")

mtcars <- mtcars

# Create the WDC JS file
writeLines(generateWDCJS(mtcars), con = js_full_path)

# Create the WDC HMTL file
writeLines(generateWDCHTML(js_path), html_path)

# Generate the file to be plumbed.
writeLines(generatePlumbedFile(mtcars), plumbed_file_path)

# Serve the file
r <- plumber::plumb(plumbed_file_path)

web_connector_html <- plumber::PlumberStatic$new("examples/simple")

r$mount("/wdc", web_connector_html)

r$run(port=8000)

