class JavascriptsController < ApplicationController
  
 caches_page :dynamic_localities  
  
  def dynamic_localities
    @dynamiclocalities = Locality.find(:all, :order => 'name')    
  end
  
end
