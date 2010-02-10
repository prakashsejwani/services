class AddDeltaField < ActiveRecord::Migration
  def self.up
    add_column :categories, :delta, :boolean
    add_column :companies, :delta, :boolean
  end

  def self.down
    remove_column :categories, :delta
    remove_column :companies, :delta
  end
end
