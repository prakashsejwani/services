class LocalitySweeper < ActionController::Caching::Sweeper
  observe Locality
  
  def after_save(locality)
    expire_cache(locality)
  end
  
  def after_destroy(locality)
    expire_cache(locality)
  end
  
  def expire_cache(locality)
    expire_page :controller => 'javascripts', :action => 'dynamic_localities', :format => 'js'
  end
  
  
end