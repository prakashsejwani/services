class AddUrlToAds < ActiveRecord::Migration
  def self.up
    add_column :companies, :ad_url, :string					
  end

  def self.down
    remove_column :companies, :ad_url
  end
end
