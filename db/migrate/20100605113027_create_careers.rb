class CreateCareers < ActiveRecord::Migration
  def self.up
    create_table :careers do |t|
      t.string :name, :limit => 50
      t.string :email, :limit => 50
      t.string :post, :limit => 50
      t.string :city, :limit => 50
      t.string :tel, :limit => 20
      t.string :mobile, :limit => 20
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :careers
  end
end
