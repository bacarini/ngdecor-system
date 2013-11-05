App.suppliers = {};

App.suppliers.after = function() {
  $("#supplier_cnpj").mask(I18n.t("mask.cnpj"));
  $("#supplier_phone").mask(I18n.t("mask.phone"));
};
