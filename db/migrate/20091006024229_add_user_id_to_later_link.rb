class AddUserIdToLaterLink < ActiveRecord::Migration
  def self.up
    change_table :later_links do |t|
      t.integer :user_id
    end
  end

  def self.down
    change_table :later_links do |t|
      t.remove :user_id
    end
  end
end
