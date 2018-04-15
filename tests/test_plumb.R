
r <- plumber::plumb("tests/test_mtcars.R")

r$run(port=8000)
