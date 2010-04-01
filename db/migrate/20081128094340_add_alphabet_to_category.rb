class AddAlphabetToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :alphabet, :string
  end

  def self.down
    remove_column :categories, :alphabet
  end
end
