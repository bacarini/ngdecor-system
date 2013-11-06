App.sellers = {};

App.sellers.after = function() {
  $("#seller_cnpj").mask(I18n.t("mask.cnpj"));
  $("#seller_phone").mask(I18n.t("mask.phone"));
};
