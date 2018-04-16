#' @get /data
function() {
  {{r_table}}
}


#' @get /WDC
#' @html
function(){

  generateWDCHTML(js_script_dir)

}
