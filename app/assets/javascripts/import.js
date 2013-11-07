App.imports = {};

App.imports["new"] = function() {
    $(":file").filestyle({classButton: "btn", buttonText: I18n.t("select_file")});

    $("#new_import").validate({
      errorElement: "span",
      errorClass:'help-inline beforeElement',
      errorPlacement: function (error, element) {
        error.insertBefore(element);
      },
      highlight: function(label) {    
        $(label).closest('.control-group').addClass('error');
      },
      success: function(label) {
        $(label).closest('.control-group').removeClass('error');
      },
      rules: {
        'import[file]': {
          required: true,
      extension: "xls|csv|xlsx"
        }
      },
      messages: {
        'import[file]': {
          extension: "Extesão de arquivo inválida!",
          required : I18n.t("errors.messages.blank")
        }
      }
    });
};
