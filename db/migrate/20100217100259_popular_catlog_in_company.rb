class PopularCatlogInCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :popular_catlog, :boolean, :default => false
  end

  def self.down
    remove_column :companies, :popular_catlog
  end
end
