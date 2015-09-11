class PageImage < ActiveRecord::Base
  mount_uploader :file, PageImageUploader
  belongs_to :page
  acts_as_list scope: :page

  validates :title, presence: true, uniqueness: true
end
