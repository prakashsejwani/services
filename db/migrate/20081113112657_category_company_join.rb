class CategoryCompanyJoin < ActiveRecord::Migration
  def self.up
    create_table :categorizations do|t|
      t.integer :category_id
      t.integer :company_id
    end
  end

  def self.down
    drop_table :categorizations
  end
end
