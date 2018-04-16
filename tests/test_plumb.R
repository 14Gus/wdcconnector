
r <- plumber::plumb("tests/test_iris.R")

r$run(port=8000)
