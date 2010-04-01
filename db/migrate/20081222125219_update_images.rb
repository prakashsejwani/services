class UpdateImages < ActiveRecord::Migration
  def self.up
    add_column :images, :ad_file_name, :string
    add_column :images, :ad_content_type, :string
    add_column :images, :ad_file_size, :integer
    add_column :images, :ad_updated_at, :datetime
    remove_column :images, :filename
    remove_column :images, :content_type
    remove_column :images, :thumbnail
    remove_column :images, :size
    remove_column :images, :parent_id
    remove_column :images, :height
    remove_column :images, :width
  end

  def self.down
    remove_column :images, :ad_file_name
    remove_column :images, :ad_content_type
    remove_column :images, :ad_file_size
    remove_column :images, :ad_updated_at
    add_column :images, :filename, :string
    add_column :images, :content_type, :string
    add_column :images, :thumbnail, :string
    add_column :images, :size, :integer
    add_column :images, :parent_id, :integer
    add_column :images, :height, :integer
    add_column :images, :width, :integer
  end
end
