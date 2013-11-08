App.customers = {};

App.customers.after = function(){
  $("#customer_phone").mask(I18n.t("mask.phone"));
  $("#customer_mobile").mask(I18n.t("mask.mobile"));
};
App.customers["new"] = function(){
  validateCustomers();
};
App.customers["edit"] = function(){
  validateCustomers();
};

function validateCustomers(){
  $('.customer_validate').validate({
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
      'customer[cpf]': {
        cpf   : true
      },
      'customer[email]':{
        email : true
      },
      'customer[phone]': {
        phone : true
      },
      'customer[mobile]': {
        phone : true
      }
    },
    messages:{
      'customer[cpf]': {
        cpf      : I18n.t("errors.messages.cpf_invalid"),
        required : I18n.t("errors.messages.blank")
      },
      'customer[name]': {
        required : I18n.t("errors.messages.blank")
      },
      'customer[email]':{
        email    : I18n.t("errors.messages.email_invalid")
      },
      'customer[phone]': {
        phone    : I18n.t("errors.messages.phone_invalid")
      },
      'customer[mobile]': {
        phone    : I18n.t("errors.messages.phone_invalid")
      }
    } 
  });
}
