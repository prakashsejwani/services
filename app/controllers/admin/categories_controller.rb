class Admin::CategoriesController < ApplicationController
  require_role :admin
  layout 'admin'
  # GET /categories
  # GET /categories.xml
  def index   	
    @categories = Category.pages(params[:page], params[:q])  	
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

  def search     
    @companies = Company.find_by_category(params[:page], params[:category_id])
     #@companies = Company.find(:all, :conditions => ["companies.id in(select company_id from categorizations where category_id = ?)", params[:category_id]])

  end
  
  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new
   @businesses = Business.find(:all, :order => :name)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
    @businesses = Business.find(:all, :order => :name)
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])
    @category.alphabet = @category.name[0,1]
   @businesses = Business.find(:all, :order => :name)
    respond_to do |format|
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        format.html { redirect_to new_admin_category_path }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])
    
    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = 'Category was successfully updated.'
        format.html { redirect_to(admin_category_path) }
        format.xml  { head :ok }
      else
       @businesses = Business.find(:all, :order => :name)
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @categorization = Categorization.find(:all, :conditions=>["category_id = ?", params[:id]])
    if @categorization.size > 0
      flash[:notice] = 'You cannot delete the category it is linked to Companies.'
    else
      @category.destroy
    end    

    respond_to do |format|
      format.html { redirect_to(admin_categories_url) }
      format.xml  { head :ok }
    end
  end
  
 
end
