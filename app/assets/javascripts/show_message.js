function ShowMessage() {
  function _message(type, text) {
    var alertClass = 'alert-' + type;
    $('.page-images').prepend("<div class='alert " + alertClass + " alert-dismissible' role='alert'><button type='button' data-dismiss='alert' class='close' aria-label='Close'><span aria-hidden='true'>×</span></button><p>" + text + "</p></div>");
    $('.' + alertClass).alert();
    $('.' + alertClass).delay(4000).slideUp(200, function() { $(this).alert('close'); });
  }

  this.error = function(message) {
    _message('danger', message)
  }

  this.success = function(message) {
    _message('success', message)
  }
}
