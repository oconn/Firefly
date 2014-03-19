class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
    	t.string :name
    	t.integer :user_id
    	t.integer :photographer_id
    	t.attachment :cover_image

      t.timestamps
    end

    add_index :galleries, :user_id
    add_index :galleries, :photographer_id

  end
end
