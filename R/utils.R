
getTemplate <- function(template_name, template_dir = TEMPLATE_DIR){

  readLines(here::here(file.path(template_dir, template_name)))

}

getTableFromQuosure <- function(table_quo){

  rlang::eval_tidy(table_quo)

}

getTableNameFromQuosure <- function(table_quo){

  table_expr <- rlang::UQE(table_quo)

  rlang::expr_text(table_expr)

}
