class AddOtherCategoryToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :other_category, :string
  end

  def self.down
    remove_column :companies, :other_category
  end
end
