class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
    	t.integer :photographer_id
      
    	t.timestamps
    end

    add_index :portfolios, :photographer_id
  end
end
