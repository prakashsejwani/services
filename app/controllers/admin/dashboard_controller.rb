class Admin::DashboardController < ApplicationController
  require_role :admin
  layout 'admin'
  
  def index
    if params[:companies]
      Company.approve(params[:companies])
    end
      @companies = Company.unapproved.paginate(:per_page=>5, :page=>params[:page],
      :select => ("id, name, locality_id, city_id, business_id,approved,to_date,other_category"),
      :include=>[:locality, :city, :business], :order => :name)
   
    if params[:reviews]
      Review.approve(params[:reviews])
    end
      @reviews = Review.unapproved.paginate(:per_page=>10, :page=>params[:page],
      :select => "id, name, email,comment, company_id, approved", :include=>[:company])
     if params[:comp]
      Company.send_mail_for_company_expiry(params[:comp])
     end
      @comp = Company.near_expiry
      @compi = Company.image_near_expiry
      @compv = Company.video_near_expiry
              
  end
    
 def mail_for_scroll_expiry
    comp = Company.find(params[:id])
    UserMailer.deliver_scroll_ads_expiry(comp)
    flash[:notice] ='message sent successfully'
    redirect_to :action => :index
 end
 
 def mail_for_image_expiry
    comp = Company.find(params[:id])
    UserMailer.deliver_image_ads_expiry(comp)
    flash[:notice] ='message sent successfully'
    redirect_to :action => :index
 end
 
 def mail_for_video_expiry
    comp = Company.find(params[:id])
    UserMailer.deliver_video_ads_expiry(comp)
    flash[:notice] ='message sent successfully'
    redirect_to :action => :index
 end
 
 end 
 