GET_SCHEMA_TEMPLATE <- 'myConnector.getSchema = function (schemaCallback) {

  {{{cols}}};

  {{{schema}}};

  schemaCallback([tableSchema]);
};'

generateWDCGetSchemaJS <- function(table){

  cols <- generateWDCColumnsJS(table)

  schema <- generateWDCSchemaJS(table)

  whisker::whisker.render(GET_SCHEMA_TEMPLATE)

}
