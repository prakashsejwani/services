class UpdateVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :video_file_name, :string
    add_column :videos, :video_content_type, :string
    add_column :videos, :video_file_size, :integer
    add_column :videos, :video_updated_at, :datetime
    remove_column :videos, :filename
    remove_column :videos, :content_type
    remove_column :videos, :size
    remove_column :videos, :parent_id
    remove_column :videos, :height
    remove_column :videos, :width
  end

  def self.down
    remove_column :videos, :video_file_name
    remove_column :videos, :video_content_type
    remove_column :videos, :video_file_size
    remove_column :videos, :video_updated_at
    add_column :videos, :filename, :string
    add_column :videos, :content_type, :string
    add_column :videos, :size, :integer
    add_column :videos, :parent_id, :integer
    add_column :videos, :height, :integer
    add_column :videos, :width, :integer
  end
end
