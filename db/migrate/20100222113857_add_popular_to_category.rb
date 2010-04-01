class AddPopularToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :popular, :boolean, :default => false
    add_column :companies, :popular_services, :boolean, :default => false
  end

  def self.down
    remove_column :categories, :popular
    remove_column :companies, :popular_services
  end
end
