class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.integer :photographer_id
    	t.string :title
    	t.text :description
    	t.text :body
    	t.attachment :cover_image

      t.timestamps
    end

    add_index :posts, :photographer_id
  end
end
