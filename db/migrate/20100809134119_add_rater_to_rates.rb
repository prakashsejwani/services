class AddRaterToRates < ActiveRecord::Migration
  def self.up
    add_column :rates, :rater_id, :integer
    add_index :rates, :rater_id
  end

  def self.down
    remove_column :rates, :rater_id
  end
end
