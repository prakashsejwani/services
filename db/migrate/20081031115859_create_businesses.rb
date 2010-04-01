class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
      t.string :name
      t.string :alphabet

      t.timestamps
    end
    add_index :businesses, :alphabet
  end

  def self.down
    drop_table :businesses
  end
end
