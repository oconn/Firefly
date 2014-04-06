class CreateBlogImages < ActiveRecord::Migration
  def change
    create_table :blog_images do |t|
    	t.attachment :image_path
      
      t.timestamps
    end
  end
end
