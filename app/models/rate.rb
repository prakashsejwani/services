class Rate < ActiveRecord::Base
  belongs_to :viewer
  belongs_to :rateable, :polymorphic => true
  
  attr_accessible :rate
end
