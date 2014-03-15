class CreatePostsTags < ActiveRecord::Migration
  def change
    create_table :posts_tags do |t|
    	t.integer :post_id
    	t.integer :tag_id

    	t.timestamps
    end
  end
end
