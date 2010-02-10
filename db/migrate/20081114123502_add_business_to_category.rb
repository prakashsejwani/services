class AddBusinessToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :business_id, :integer
  end

  def self.down
    remove_column :categories, :business_id
  end
end
