class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name, :size => 50
      t.string :address1, :size => 100
      t.string :address2, :size => 100
      t.integer :locality_id
      t.integer :city_id
      t.string :state, :size => 50
      t.string :country, :size => 50
      t.string :pincode, :size => 7
      t.string :phone1, :size => 15
      t.string :phone2, :size => 15
      t.string :fax, :size => 15
      t.string :email, :size => 50
      t.string :contact, :size => 50
      t.text :about
      t.integer :business_id

      t.timestamps
    end
    add_index :companies, :locality_id
    add_index :companies, :city_id
    add_index :companies, :business_id
    add_index :companies, :pincode
    add_index :companies, :address1
    add_index :companies, :address2
    add_index :companies, :name
  end

  def self.down
    drop_table :companies
    remove_index :companies, :locality_id
    remove_index :companies, :city_id
    remove_index :companies, :business_id
    remove_index :companies, :pincode
    remove_index :companies, :address1
    remove_index :companies, :address2
    remove_index :companies, :name
  end
end
