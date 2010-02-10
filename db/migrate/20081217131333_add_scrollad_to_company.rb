class AddScrolladToCompany < ActiveRecord::Migration
  def self.up
    
    add_column :companies, :scroll_ads, :boolean, :default => false
    
  end

  def self.down
    
    remove_column :companies,:scroll_ads
    
  end
end
