(function () {
    var myConnector = tableau.makeConnector();

    {{{get_schema_js}}}

    {{{get_data_js}}}

    tableau.registerConnector(myConnector);
      {{{connector_js}}}

})();
