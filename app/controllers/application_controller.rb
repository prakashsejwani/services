# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  
  before_filter :cities, :businesses, :localities, :categories, :company_scroll_ad
  #helper :all # include all helpers, all the time
  filter_parameter_logging :password, :password_confirmation
   
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
   protect_from_forgery # :secret => '9fe6825f97cc334d88925fde5c4808a8'
   include AuthenticatedSystem
   include RoleRequirementSystem
  
 private
  
  def cities
    @cities = City.find(:all, :order => :name)
  end
  
  def businesses
    @businesses = Business.find(:all, :order => :name)
  end
    
  def localities
    @localities = Locality.find(:all)
  end
   
  def categories
    @categories = Category.find(:all, :order => :name)
  end
  
  # this is for scrolling ads in dashboard and home controller
 def company_scroll_ad
    @companies = Company.find(:all, :conditions=>['scroll_ads = true'])
 end

end
