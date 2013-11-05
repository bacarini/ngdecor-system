App.products = {};

App.products["demo"] = function() {
    $.getJSON( "/categories", function(data){ 
      var listCategory = []
      $.each( data, function( key, val ) { 
        listCategory[key] = val.name;
      })
    });
};

App.products.after = function(){
  $("#product_price").mask(I18n.t("mask.money"));
};
