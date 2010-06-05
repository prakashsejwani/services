class AdvertisementsController < ApplicationController
  require_role :admin, :only=>[:delete] #:only=>[:create, :new, :delete]
  before_filter :dependency  
  protect_from_forgery :only => [:create, :update, :destroy]
  
  def index
    @companies = Company.approved_by_admin.find(:all, :select => ("id, name, locality_id, city_id, business_id,imageapprove,videoapprove"),
                 :include => [:locality, :city, :business])
     if params[:owner_id]
      @companies = Company.find(:all, :select => ("id, name, locality_id, city_id, business_id,imageapprove,videoapprove"),
                :include => [:locality, :city, :business ], :conditions => ['owner_id = ?', params[:owner_id]])
    end            
    if params[:tag]
      @companies = Company.find_tagged_with(params[:tag])
    end
    respond_to do |format|
      format.html { render :layout => 'login' }
      format.xml  { render :xml => @companies }
    end
  end
  
  def show
    @company = Company.find(params[:id])
    @rev = @company.reviews.approved_by_admin
	  @video = @company.video
    respond_to do |format|
      format.html { render :layout => 'home' }
      format.xml  { render :xml => @company }
    end
  end

   def rate
   @company = Company.find(params[:id])
   @company.rate(params[:stars],current_user)
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @company }
      format.js
      end
   end
 
 
  def stream
    # Many players require that we GET an URL ending in .flv or they will not playback the video
    hashed_name = params[:id]
    video = Video.find_by_video_file_name(hashed_name+".flv")
    if video
      send_file(video.video.path, :filename => video.video_file_name, :type => 'video/x-flv', :disposition => 'inline')
    else
      render :nothing => true, :status => 404
    end
  end 
  
  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
    @newfile = Image.new
    @allowed = 5 - @company.images.count
    cities
    localities
    businesses
    categories
    
    respond_to do |format|
      format.html { render :layout => 'login' }
      format.xml  { render :xml => @company }
    end
  end
  
  def new
    @company = Company.new
    @image = Image.new
    cities
    localities
    businesses
    categories
    
    respond_to do |format|
      format.html { render :layout => 'home' }
      format.xml  { render :xml => @company }
    end
  end
  
  def reviews
     @company = Company.find(params[:id])
     @rev = @company.reviews.find(:all)
     respond_to do |format|
      format.html { render :layout => 'login' }      
    end
  end
  
  def create
    @company = Company.new(params[:company])
    save_company
    @company.owner_id = current_user.id if current_user
    respond_to do |format|
      if @company.save
        flash[:notice] =  'Thank You, for your Interest Our executive will get back to you shortly.'
       format.html { redirect_to(root_path)}
       format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
        cities
        localities
        businesses
        categories
        @image =Image.new
       
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @company = Company.find(params[:id])
    save_company
    respond_to do |format|
      if @company.update_attributes(params[:company])
       process_file_uploads if params[:attachment]
          if params[:video]
	    unless params[:video][:uploaded_data].blank?
		video = Video.new("uploaded_data" => params[:video][:uploaded_data])
		@company.video = video
		@company.video.save!
	    end
          end
        flash[:notice] = 'Company was successfully updated.'
        format.html { redirect_to(advertisement_path(@company)) }
        format.xml  { head :ok }
      else
        cities
        localities
        businesses
        categories
        @image = Image.new
        
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end
 
 def save_company
     @company.name = params[:company][:name]
     @company.address1 = params[:company][:address1]
     @company.address2 = params[:company][:address2]
     @company.locality_id = params[:company][:locality_id]
     @company.city_id = params[:company][:city_id]
     @company.state = params[:company][:state]
     @company.country = params[:company][:country]
     @company.pincode = params[:company][:pincode]
     @company.phone1 = params[:company][:phone1]
     @company.phone2 = params[:company][:phone2]
     @company.fax = params[:company][:fax]
     @company.email = params[:company][:email]
     @company.contact = params[:company][:contact]
     @company.about = params[:company][:about]
     @company.business_id = params[:company][:business_id]
     @company.image_ad = params[:company][:image_ad]
     #@company.image_ad_content_type = params[:company][:image_ad_content_type]
     #@company.image_ad_file_size = params[:company][:image_ad_file_size]
     #@company.approved = params[:company][:approved]
     @company.other_category = params[:company][:other_category]
     #@company.imageapprove = params[:company][:imageapprove]
     #@company.videoapprove = params[:company][:videoapprove]
     @company.owner_id = params[:company][:owner_id]
     @company.reviews_count = params[:company][:reviews_count]
     #@company.priority = params[:company][:priority]
     #@company.scroll_ads = params[:company][:scroll_ads]
     @company.ad_url = params[:company][:ad_url]
     @company.category_ids = params[:category_ids]
  end

 protected
  def process_file_uploads
    i = 0
    while params[:attachment]['file_'+i.to_s] != "" && !params[:attachment]['file_'+i.to_s].nil?
      @image = Image.new(Hash["ad" => params[:attachment]['file_'+i.to_s]])
      @company.images << @image
      i += 1 
      @image.save!
    end   
  end

private  
  def dependency
     cities
     localities
     businesses
     
  end  

end
