$(function() {
  function Initializers() {

    this.bootstrapTags = function(tagsForInitialize) {
      var elWithTags = $('#tags_list');
      var tagsContainer = $('#page-tag-list-container');
      var _updateInputWithTags = function() {
        elWithTags.val(tagsContainer.tags().getTags().join(', '));
      }

      tagsContainer.tags({
        suggestions: elWithTags.data('all-tags'),
        tagData: (elWithTags.val().length > 0) ? elWithTags.val().split(', ') : [],
        afterAddingTag: _updateInputWithTags,
        afterDeletingTag: _updateInputWithTags,
        promptText: ' Enter tags or click "down" button to see all available tags'
      });
    }

    this.sortable = function() {
      $("#sortable").sortable({
        axis: 'y',
        update: function(event, ui) {
          $.post($(this).data('update-url'), { id: ui.item.data('image-id'), position: ui.item.index() });
        }
      });
      $("#sortable").disableSelection();
    }
  }

  window.initializers = new Initializers();
});
