class HomeController < ApplicationController
  before_filter :dependency
  
  def index    
    @alpha = params[:alpha]    
    @alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")
    unless @alpha.blank?
      @categories = Category.paginate(:per_page=>70, :page=>params[:page], :conditions=>['alphabet = ?',@alpha], :order=>'name')      
    else
      @categories = []
    end
  end

  def career
	company_scroll_ad
  end

  def about
	company_scroll_ad
  end

  

  private
  def dependency
   @localities = Locality.find(:all)
     @cities = City.find(:all, :order => :name)
  end
end
