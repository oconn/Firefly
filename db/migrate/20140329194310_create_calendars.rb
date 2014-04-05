class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
    	t.integer :photographer_id
    	t.string :feed
    end

    add_index :calendars, :photographer_id
  end
end
