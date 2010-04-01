require 'test_helper'
class BusinessTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  load_all_fixtures
  #def setup
  #  @business = Business.create!(params)
  #end
  
  should_require_attributes :name, :alphabt
  should_require_unique_attributes :name
  should_not_allow_values_for :name, "1234" 
  should_allow_values_for :alphabt, "123"
end
