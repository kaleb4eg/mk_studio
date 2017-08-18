class AddPositionTitleAndDescriptionToPageImages < ActiveRecord::Migration
  def change
    add_column :page_images, :position, :integer
    add_column :page_images, :title, :string
    add_column :page_images, :description, :string
  end
end
