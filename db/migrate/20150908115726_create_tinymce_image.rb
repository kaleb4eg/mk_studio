class CreateTinymceImage < ActiveRecord::Migration
  def change
    create_table :tinymce_images do |t|
      t.string :file
      t.references :imageable, polymorphic: true, index: true
    end
  end
end
