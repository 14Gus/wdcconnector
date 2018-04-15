

generatePlumbedFile <- function(r_table, path = tempfile()){

  r_table <- substitute(r_table)

  template <- readLines("templates/plumbed_data_template.R")

  writeLines(whisker::whisker.render(template), con=path)

}

servePlumbedFile <- function(plumbed_path, port=DEFAULT_PORT){
  r <- plumber::plumb(plumbed_path)

  r$run(port=port)

}

