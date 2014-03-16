class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
    	t.string :name
    	t.integer :user_id
    	t.integer :photographer_id
    	t.attachment :cover_image

      t.timestamps
    end
  end
end
