class CreatePortfolioImages < ActiveRecord::Migration
  def change
    create_table :portfolio_images do |t|
    	t.attachment :image_path
      t.integer :portfolio_id

    	t.timestamps
    end

    add_index :portfolio_images, :portfolio_id
  end
end
