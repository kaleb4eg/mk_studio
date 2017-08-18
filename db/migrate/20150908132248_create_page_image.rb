class CreatePageImage < ActiveRecord::Migration
  def change
    create_table :page_images do |t|
      t.string :file
      t.references :page, index: true
    end
  end
end
