class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :company

  #--- validations ---
  validates_presence_of :category_id
end