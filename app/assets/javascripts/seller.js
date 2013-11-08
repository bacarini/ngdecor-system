App.sellers = {};

App.sellers.after = function() {
  $("#seller_cnpj").mask(I18n.t("mask.cnpj"));
  $("#seller_phone").mask(I18n.t("mask.phone"));
};
App.sellers["new"] = function(){
  validateSellers();
};
App.sellers["edit"] = function(){
  validateSellers();
};

function validateSellers(){
  $('.seller_validate').validate({
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
      'seller[cnpj]': {
        cnpj  : true
      },
      'seller[email]':{
        email : true
      },
      'seller[phone]': {
        phone : true
      }
    },
    messages:{
      'seller[cnpj]': {
        cnpj     : I18n.t("errors.messages.cnpj_invalid"),
        required : I18n.t("errors.messages.blank")
      },
      'seller[name]': {
        required : I18n.t("errors.messages.blank")
      },
      'seller[email]':{
        email    : I18n.t("errors.messages.email_invalid")
      },
      'seller[phone]': {
        phone : I18n.t("errors.messages.phone_invalid")
      }
    } 
  });
}
