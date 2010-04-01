class Videos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :filename, :content_type
      t.integer :size, :parent_id, :height, :width

      # Magic is here
      t.column :asset_id, :integer
      t.column :asset_type, :string

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end