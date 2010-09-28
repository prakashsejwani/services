class AddPriorityToCompany < ActiveRecord::Migration
  def self.up
   
     add_column :companies, :from_date, :date
     add_column :companies, :to_date, :date
  end

  def self.down
     
    remove_column :companies, :from_date
    remove_column :companies, :to_date
  end
end
