class ReviewsController < ApplicationController
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

 
end
