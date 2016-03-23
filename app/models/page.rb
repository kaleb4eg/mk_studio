class Page < ActiveRecord::Base
  acts_as_taggable

  enum page_type: { page: 0, project: 1 }

  has_many :page_images, -> { order(position: :asc) }, dependent: :destroy
end
