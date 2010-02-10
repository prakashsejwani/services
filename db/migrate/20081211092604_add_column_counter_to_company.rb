class AddColumnCounterToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :reviews_count, :integer, :default => 0
     
     Company.reset_column_information
     Company.find(:all).each do |c|
      c.update_attribute :reviews_count, c.reviews.approved_by_admin.length
   end
  end

  def self.down
    
    remove_column :companies, :reviews_count
    
  end
end
