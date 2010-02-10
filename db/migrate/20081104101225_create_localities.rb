class CreateLocalities < ActiveRecord::Migration
  def self.up
    create_table :localities do |t|
      t.string :name
      t.integer :city_id

      t.timestamps
    end
    add_index :localities, :city_id
  end

  def self.down
    drop_table :localities
  end
end
