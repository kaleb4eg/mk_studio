class Page < ActiveRecord::Base
  acts_as_taggable
  translates :title, :description, :content

  enum page_type: { page: 0, project: 1 }

  has_many :page_images, -> { order(position: :asc) }, dependent: :destroy
end
