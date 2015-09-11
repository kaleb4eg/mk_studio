class Page < ActiveRecord::Base
  has_many :page_images, -> { order(position: :asc) }, dependent: :destroy
end
