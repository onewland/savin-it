class CreateLaterLinks < ActiveRecord::Migration
  def self.up
    create_table :later_links do |t|
      t.string :url
      t.integer :estimated_duration
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :later_links
  end
end
