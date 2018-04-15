
generateWDCHTML <- function(js_script_path){

  template <- readLines("templates/WDC_template.html")

  whisker::whisker.render(template)
}
