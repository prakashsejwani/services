class AddColumnToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :imageapprove , :boolean, :default => false
    add_column :companies, :videoapprove , :boolean, :default => false
    add_column :companies, :owner_id, :integer
    add_column :companies, :priority, :boolean, :default => false
  end

  def self.down
    remove_column :companies , :imageapprove
    remove_column :companies , :videoapprove
    remove_column :companies, :owner_id
    remove_column :companies, :priority
  end
end

