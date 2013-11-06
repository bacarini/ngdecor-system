App.imports = {};

App.imports["new"] = function() {
    $(":file").filestyle({classButton: "btn", buttonText: I18n.t("select_file")});
};
