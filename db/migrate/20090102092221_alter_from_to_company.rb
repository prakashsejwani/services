class AlterFromToCompany < ActiveRecord::Migration
  def self.up
    change_column :companies, :from_date, :date
    change_column :companies, :to_date, :date
  end

  def self.down
    change_column :companies, :from_date
    change_column :companies, :to_date
  end
end
