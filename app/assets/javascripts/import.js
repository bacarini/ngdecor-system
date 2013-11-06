App.imports = {};

App.imports["new"] = function() {
    $(":file").filestyle({classButton: "btn", buttonText: I18n.t("select_file")});

    $(".import").validate({
      rules: {
        'import[file]': {
          required: true,
          extension: "xls|csv|xlsx"
        }
      },
      messages: {
        'import[file]': "Extesão de arquivo inválida!"               
      }
    });
};
