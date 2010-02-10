class Admin::CompaniesController < ApplicationController
  require_role :admin
  layout 'admin'
  
  # GET /companies
  def index 
     @companies = Company.srch(params[:search], params[:city], params[:locality], params[:page], false)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companies }
    end
  end
  
  # GET /companies/1
  # GET /companies/1.xml
  def show
    @company = Company.find(params[:id])    
    @video = @company.video
       
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @company }
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
 
  def new
    @company = Company.new
    @image = Image.new
    @users = User.find(:all)
    cities
    localities
    businesses
    categories
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company }
    end
  end
  
  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
    @newfile = Image.new
    @allowed = 5 - @company.images.count
    @users = User.find(:all)
    cities
    localities
    businesses
    categories
  end
  
   def add_category
      @company = Company.find(params[:id])
      unless @company.other_category.blank?
        cat = Category.new(:name => @company.other_category, :alphabet => @company.other_category[0,1]) 
        @company.categories << cat
        cat.save!
       @company.other_category = ""
       @company.save!
      end
      flash[:notice] = 'other category added to categories'
      if params[:add] == "y"
        redirect_to :action => :index 
      else
        redirect_to :action => :edit 
    end
   end
  
  # POST /companies
  # POST /companies.xml
  def create
    @company = Company.new(params[:company])
    save_company
    respond_to do|format|
      if @company.save
        process_file_uploads  
        unless params[:video][:uploaded_data].blank?
          video = Video.new("video" => params[:video][:uploaded_data])
          @company.video = video
          @company.video.save!
        end
        flash[:notice] = 'Company was successfully created.'        
        format.html { redirect_to(new_admin_company_path) }
        format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
       cities
       localities
       businesses
       categories
       @image = Image.new
         
       format.html { render :action => "new" }
       format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }    
      end
    end
    
  end
  
  # PUT /companies/1
  # PUT /companies/1.xml
  def update
    @company = Company.find(params[:id])
     #scroll = @company.scroll_ads
     if @company.scroll_ads == true
       scroll = 1
     elsif @company.scroll_ads == false
       scroll = 0
     end
      #imgapp = @company.imageapprove
     if @company.imageapprove == true
        imgapp = 1
     elsif @company.imageapprove == false
       imgapp = 0
     end
     #video = @company.videoapprove
     if @company.videoapprove == true
       video = 1
     elsif @company.videoapprove == false
      video = 0
     end
    save_company
    if scroll == 0 && params[:company][:scroll_ads].to_i == 1
      UserMailer.deliver_scroll_ads_approved(@company )
    elsif scroll == 1 && params[:company][:scroll_ads].to_i == 0
        UserMailer.deliver_scroll_ads_unapproved(@company )
    end
     if imgapp == 0 && params[:company][:imageapprove].to_i == 1
      UserMailer.deliver_image_ads_approved(@company)
    elsif imgapp == 1 && params[:company][:imageapprove].to_i == 0
        UserMailer.deliver_image_ads_unapproved(@company)
    end
    if video == 0 && params[:company][:videoapprove].to_i == 1
      UserMailer.deliver_video_ads_approved(@company)
    elsif video == 1 && params[:company][:videoapprove].to_i == 0
        UserMailer.deliver_video_ads_unapproved(@company)
    end
    respond_to do |format|
     if @company.save
       process_file_uploads if params[:attachment]       
          unless params[:video][:uploaded_data].blank?
            video = Video.new("video" => params[:video][:uploaded_data])
            @company.video = video
            video.save
          end              
       flash[:notice] = 'Company was successfully updated.'
       format.html { redirect_to(admin_company_path(@company)) }
       format.xml  { head :ok }
     else
       cities
       localities
       businesses
       @newfile = Image.new
       categories
       @users = User.find(:all)
       format.html { render :action => "edit" }
       format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
       format.js 
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
     @company.category_ids = params[:category_ids]
     @company.image_ad = params[:company][:image_ad]
     @company.approved = params[:company][:approved]
     @company.other_category = params[:company][:other_category]
     @company.imageapprove = params[:company][:imageapprove]
     @company.videoapprove = params[:company][:videoapprove]
     @company.owner_id = params[:company][:owner_id]
     @company.reviews_count = params[:company][:reviews_count]
     @company.priority = params[:company][:priority]
     @company.from_date = params[:company]["from_date(1i)"].to_s + "-" + params[:company]["from_date(2i)"].to_s + "-" + params[:company]["from_date(3i)"].to_s 
     @company.to_date = params[:company]["to_date(1i)"].to_s + "-" + params[:company]["to_date(2i)"].to_s + "-" + params[:company]["to_date(3i)"].to_s
     @company.scroll_ads = params[:company][:scroll_ads]
     @company.ad_url = params[:company][:ad_url]
     @company.image_from_date = params[:company]["image_from_date(1i)"].to_s + "-" + params[:company]["image_from_date(2i)"].to_s + "-" + params[:company]["image_from_date(3i)"].to_s 
     @company.image_to_date = params[:company]["image_to_date(1i)"].to_s + "-" + params[:company]["image_to_date(2i)"].to_s + "-" + params[:company]["image_to_date(3i)"].to_s
     @company.video_from_date = params[:company]["video_from_date(1i)"].to_s + "-" + params[:company]["video_from_date(2i)"].to_s + "-" + params[:company]["video_from_date(3i)"].to_s 
     @company.video_to_date = params[:company]["video_to_date(1i)"].to_s + "-" + params[:company]["video_to_date(2i)"].to_s + "-" + params[:company]["video_to_date(3i)"].to_s
     @company.category_ids = params[:category_ids]   
  end
  
  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    
    respond_to do |format|
      format.html { redirect_to(admin_companies_url) }
      format.xml  { head :ok }
    end
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
  
end

