class PageImage < ActiveRecord::Base
  mount_uploader :file, PageImageUploader

  belongs_to :page

  validates :title, presence: true, uniqueness: true
end
