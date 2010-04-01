class ImgVdoFromTo < ActiveRecord::Migration
  def self.up
    add_column :companies, :image_from_date, :date
    add_column :companies, :image_to_date, :date
    add_column :companies, :video_from_date, :date
    add_column :companies, :video_to_date, :date
  end

  def self.down
    remove_column :companies, :image_from_date
    remove_column :companies, :image_to_date
    remove_column :companies, :video_from_date
    remove_column :companies, :video_to_date
  end
end
