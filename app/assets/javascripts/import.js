App.imports = {};

App.imports["new"] = function() {
    $(":file").filestyle({classButton: "btn btn btn-success", buttonText: I18n.t("select_file")});
};
