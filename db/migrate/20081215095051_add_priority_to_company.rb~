class AddPriorityToCompany < ActiveRecord::Migration
  def self.up
   
     add_column :companies, :from_date, :string
     add_column :companies, :to_date, :string
  end

  def self.down
     
    remove_column :companies, :from_date
    remove_column :companies, :to_date
  end
end
