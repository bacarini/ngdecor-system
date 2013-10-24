$(function(){
    $.getJSON( "/categories", function(data){ 
      var listCategory = []
      $.each( data, function( key, val ) { 
        listCategory[key] = val.name;
      })
    });
});
