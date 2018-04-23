#' @get /data
function() {
  iris
}


#' @get /WDC
#' @html
function(){

  generateWDCHTML(js_script_dir)

}
