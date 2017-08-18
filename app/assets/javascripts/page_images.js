$(function() {
  function ModalActions() {
    var _showMessage = new ShowMessage();
    function _modalWindow() { return $('#modal-actions'); }
    function _modalTitle() { return $('#modal-actions-label'); }

    this.openModal = function(html) {
      _modalWindow().find('.action-content').html(html);
      _modalWindow().modal('show');
    }
    this.closeModalAndShowMessage = function(message) {
      _modalWindow().modal('hide');
      _showMessage.success(message);
    }
    this.setHeader = function(text) {
      _modalTitle().text(text);
    }
    this.insertImage = function(html) {
      $('#sortable').append(html);
    }
    this.deleteImage = function(id) {
      $('#page_image_' + id).remove();
    }
    this.updateImage = function(id, html) {
      $('#page_image_' + id).replaceWith(html);
    }
  }

  window.modalActions = new ModalActions();
});
