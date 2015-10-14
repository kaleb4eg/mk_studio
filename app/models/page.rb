class Page < ActiveRecord::Base
  acts_as_taggable

  has_many :page_images, -> { order(position: :asc) }, dependent: :destroy
end
