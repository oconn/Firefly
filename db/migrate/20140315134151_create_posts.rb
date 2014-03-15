class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.integer :photographer_id
    	t.string :title
    	t.text :description
    	t.text :body

      t.timestamps
    end
  end
end
