class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
    	t.text :body
    	t.string :ip_address
    	t.integer :post_id
    	t.string :nickname, default: nil
    	
      t.timestamps
    end

    add_index :comments, :post_id
  end
end
