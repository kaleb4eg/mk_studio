class DropTableTinymceImages < ActiveRecord::Migration
  def up
    drop_table :tinymce_images
  end

  def down
    create_table :tinymce_images do |t|
      t.string :file
      t.references :imageable, polymorphic: true, index: true
    end
  end
end
