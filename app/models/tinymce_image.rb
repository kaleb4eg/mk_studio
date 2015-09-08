class TinymceImage < ActiveRecord::Base
  mount_uploader :file, TinymceImageUploader

  belongs_to :imageable, polymorphic: true
end
