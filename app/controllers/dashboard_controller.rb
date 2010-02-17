class DashboardController < ApplicationController
  before_filter :dependency
  auto_complete_for :company, :name
  # GET /
  # The default dashboard
  def index 
    localities
    company_scroll_ad
    @popular_catlogs = Company.popular
  end
  
  # this action shows the search results
  def search
    if params[:city]
      session[:city] = params[:city]
    end
    if params[:locality].present?
      conditions = {:city => params[:city], :locality => params[:locality]}
    else
      conditions = {:city => params[:city]}
    end
    set_city(params[:city])
    if params[:radio] == "company" 
      @companies = Company.search params[:q],
                   :conditions=> conditions, :order => :priority, :sort_mode => :desc,
                   :include=>[:locality, :city, :business, :images, :categories, :rates],                   
                   :page => params[:page],
                   :per_page => 5,
                   :with => {:approved=>true}
                   
      @comp = Company.search params[:q], 
                   :include=>[:images],
                   :conditions=> conditions,
                   :with => {:approved=>true}
      @categories = Category.search(:conditions => {:company => params[:q]})
      if @categories.nil? || @categories.empty?
        @categories = Category.search(params[:q])
      end
    elsif params[:radio] == "category"
       city = params[:city] || session[:city]
       set_city(params[:city])
       find_company(params[:q], city, params[:locality], params[:page])
    elsif params[:category]
       find_company(params[:q], params[:city], params[:locality], params[:page])
    end    
    @localities = Locality.find(:all)
    respond_to do |format|
      format.html # display index.html.erb
      format.js 
    end
  end
  
  # this method finds companies and related categories using sphinx
  def find_company(q, city, locality, page) 
    if locality.present?
      conditions = {:category_name => q, :city => city, :locality => locality}
    else
      conditions = {:category_name => q, :city => city}
    end  
    @companies = Company.search(:conditions => conditions,  :order => :priority, :sort_mode => :desc,
    	  :include=>[:locality, :city, :images, :categories, :rates],
          :with => {:approved=>true},
          :page => page,
          :per_page => 5)
          
    @comp = Company.search(:conditions => {:category_name => q, :city => city, :locality => locality}, :include=>[:images], :with => {:approved=>true})
    @categories = Category.search(q)
  end
 
  def set_city(city=nil)
    if city.nil?
      session[:city] ||= City.find(:first, :conditions=>["name = 'mumbai'"]).id
    else
      session[:city] = city
    end 
  end
  

  private  
  def dependency
     cities
     localities
     businesses
     company_scroll_ad
  end  
end
