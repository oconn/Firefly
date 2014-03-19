class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :image_path
      t.integer :rating
      t.integer :gallery_id

      t.timestamps
    end

    add_index :images, :gallery_id
  end
end
