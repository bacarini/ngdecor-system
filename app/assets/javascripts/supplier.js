App.suppliers = {};

App.suppliers.before = function() {
  $("#supplier_cnpj").mask(I18n.t("mask.cnpj"));
  $("#supplier_phone").mask(I18n.t("mask.phone"));
};
App.suppliers["new"] = function(){
  $('#new_supplier').validate({
    errorElement: "span",
    errorClass:'help-inline',
    highlight: function(label) {    
      $(label).closest('.control-group').addClass('error');
    },
    errorPlacement: function (error, element) { 
      if (element.parent().hasClass("input-append")){
        error.insertAfter(element.parent());
      }else{
        error.insertAfter(element);     
      } 
    },                   
    onkeyup: false,      
    onblur: false,  
    success: function(label) {
      $(label).closest('.control-group').removeClass('error');
    },
    rules:{
      'supplier[cnpj]': {
        cnpj     : 'both'
      }
    },
    messages:{
      'supplier[cnpj]': {
        cnpj     : I18n.t("errors.messages.cnpj_invalid"),
        required : I18n.t("errors.messages.blank")
      },
      'supplier[name]': {
        required : I18n.t("errors.messages.blank")
      }
    } 
  });
}
