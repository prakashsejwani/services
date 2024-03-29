# See how all your routes lay out with "rake routes"
ActionController::Routing::Routes.draw do |map|
  map.resources :careers

  
  # RESTful rewrites authentication
  
  map.signup   '/signup',   :controller => 'users',    :action => 'new'
  map.register '/register', :controller => 'users',    :action => 'create'
  map.activate '/activate/:activation_code', :controller => 'users',    :action => 'activate'
  map.login    '/login',    :controller => 'sessions', :action => 'new'
  map.logout   '/logout',   :controller => 'sessions', :action => 'destroy', :conditions => {:method => :delete}
  
  map.user_troubleshooting '/users/troubleshooting', :controller => 'users', :action => 'troubleshooting'
  map.user_forgot_password '/users/forgot_password', :controller => 'users', :action => 'forgot_password'
  map.user_reset_password  '/users/reset_password/:password_reset_code', :controller => 'users', :action => 'reset_password'
  map.user_forgot_login    '/users/forgot_login',    :controller => 'users', :action => 'forgot_login'
  map.user_clueless        '/users/clueless',        :controller => 'users', :action => 'clueless'
  
  map.open_id_complete '/opensession', :controller => "sessions", :action => "create", :requirements => { :method => :get }
  map.open_id_create '/opencreate', :controller => "users", :action => "create", :requirements => { :method => :get }
    
  map.resources :users, :member => { :edit_password => :get,
                                     :update_password => :put,
                                     :edit_email => :get,
                                     :update_email => :put,
                                     :edit_avatar => :get, 
                                     :update_avatar => :put }
                            
  map.resource :session
    
  # Profiles
   map.resources :profiles
   
  # Advertisements and reviews 
   map.resources :companies, :collection => {:stream => :get}, :member => {:rate => :post, :new_review => :get}
   map.resources :reviews
  # Administration
  map.namespace(:admin) do |admin|
    admin.root :controller => 'dashboard', :action => 'index'
    admin.resources :settings
    admin.resources :businesses
    admin.resources :cities
    admin.resources :localities
    admin.resources :companies, :collection => {:popular_catlog => :get, :not_popular_catlog => :get, :popular_services => :get, 
                                                :unpopular_services => :get} 
    admin.resources :reviews                                            
    admin.resources :categories, :collection => {:popular_products => :get, :unpopular_products => :get}
    admin.catsearch '/catsearch', :controller => "categories", :action => "search"
    admin.resources :users, :member => { :suspend   => :put,
                                         :unsuspend => :put,
                                         :activate  => :put, 
                                         :purge     => :delete,
                                         :reset_password => :put },
                            :collection => { :pending   => :get,
                                             :active    => :get, 
                                             :suspended => :get, 
                                             :deleted   => :get }
  end
  
  # Dashboard as the default location
  map.root :controller => 'dashboard', :action => 'index'
  map.search '/search', :controller => "dashboard", :action => 'search'
  
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action.:format'
  map.connect ':controller/:action/:id.:format'
end
