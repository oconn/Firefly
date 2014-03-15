class CreateBlacklistIps < ActiveRecord::Migration
  def change
    create_table :blacklist_ips do |t|
      t.string :ip_address

      t.timestamps
    end

    add_index :blacklist_ips, :ip_address
  end
end
