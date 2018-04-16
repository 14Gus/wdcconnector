
generateWDCHTML <- function(js_script_path){

  template <- getTemplate("WDC_template.html")

  whisker::whisker.render(template)
}
