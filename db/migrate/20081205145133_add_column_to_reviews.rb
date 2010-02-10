class AddColumnToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :company_id, :integer
    add_column :reviews, :user_id, :integer
    add_column :reviews, :approved, :boolean, :default => false
  end

  def self.down
     remove_column :reviews, :company_id
     remove_column :reviews, :user_id
    remove_column :reviews, :approved
  end
end
