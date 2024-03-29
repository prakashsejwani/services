class Admin::ReviewsController < ApplicationController
#  before_filter :load_company
  def index
    #redirect_to admin_root_path
  end

  # GET /reviews/1
  # GET /reviews/1.xml
  def show
     @review = Review.find(params[:id])
     #@company = Company.find(params[:review][:company_id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.xml
  def new
     @review = Review.new
     
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @review }
      format.js
    end
  end

  # GET /reviews/1/edit
  def edit
   @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.xml
  def create
    @review = Review.new(params[:review])
    @review.user_id = current_user.id if current_user
    @company = Company.find(params[:review][:company_id])
    respond_to do |format|
      if @review.save
        flash[:notice] = 'Thank your for your review.All submitted content will be the sole property of services.com, and may be used, edited or rejected at services sole discretion.'
        format.html { redirect_to(@company) }
        format.xml  { render :xml => @review, :status => :created, :location => @review }
        #format.js
      else
        format.html { redirect_to(@company)}
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
        #format.js
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.xml
  def update
   @review = Review.find(params[:id])
   respond_to do |format|
      if @review.update_attributes(params[:review])
        flash[:notice] = 'Review was successfully updated.'
        format.html { redirect_to(companies_path(@company)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.xml
  def destroy
     @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to(reviews_url) }
      format.xml  { head :ok }
    end
  end
  
#   def load_company
#    @company = Company.find(params[:company_id])
#  end
#  
end
