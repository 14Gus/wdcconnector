

generatePlumbedFile <- function(r_table, path = tempfile()){

  r_table <- rlang::enquo(r_table)

  template <- getTemplate("plumbed_data_template.R")

  writeLines(whisker::whisker.render(template), con=path)

}

servePlumbedFile <- function(plumbed_path, port=DEFAULT_PORT){
  r <- plumber::plumb(plumbed_path)

  r$run(port=port)
}
