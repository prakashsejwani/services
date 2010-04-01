class AddIndexToImageVideo < ActiveRecord::Migration
  def self.up
    add_index :images, :asset_id
    add_index :videos, :asset_id
  end

  def self.down
    remove_index :images, :asset_id
    remove_index :videos, :asset_id
  end
end
