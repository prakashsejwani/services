class AddAdminColumnToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies ,:approved, :boolean , :default => false
    
    end
    
 

  def self.down
    remove_column :companies, :approved
  end
end
