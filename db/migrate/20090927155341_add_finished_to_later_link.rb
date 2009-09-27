class AddFinishedToLaterLink < ActiveRecord::Migration
  def self.up
    add_column :later_links, :finished, :boolean
  end

  def self.down
    remove_column :later_links, :finished
  end
end
