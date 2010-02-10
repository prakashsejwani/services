class UpdateReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :review_ad_file_name, :string
    add_column :reviews, :review_ad_content_type, :string
    add_column :reviews, :review_ad_file_size, :integer
    add_column :reviews, :review_ad_updated_at, :datetime
  end

  def self.down
    remove_column :reviews, :review_ad_file_name
    remove_column :reviews, :review_ad_content_type
    remove_column :reviews, :review_ad_file_size
    remove_column :reviews, :review_ad_updated_at
  end
end
