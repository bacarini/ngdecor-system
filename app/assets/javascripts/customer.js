App.customers = {};

App.customers.after = function(){
  $("#customer_phone").mask(I18n.t("mask.phone"));
  $("#customer_mobile").mask(I18n.t("mask.mobile"));
};
