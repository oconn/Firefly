class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
			t.integer :visitable_id
			t.string :visitable_type, :limit => 30
			t.integer :total_visits
			t.integer :unique_visits

			t.timestamps
    end
    
    add_index :visits, :visitable_id
    add_index :visits, :visitable_type
  end
end
