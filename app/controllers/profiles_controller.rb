class ProfilesController < ApplicationController
  before_filter :find_profile
  before_filter :check_owner_access, :only => [:edit, :update]
  before_filter :dependency
  
  def show
    # render show.html.erb
  end
  
  def edit
    # render edit.html.erb
  end
  
  def update    
    unless @profile.nil?
      @profile.update_attributes(params[:profile])
      flash[:notice] = "Your profile has been succesfully updated."
      redirect_to profile_url(@profile.user)
    else
      render :edit
    end
  end
  
  protected

  def find_profile
    begin
      @user = User.find(params[:id])
    rescue
      @user = nil
    end
    @profile = @user.nil? ? nil : @user.profile
  end    
  
  def check_owner_access
    unless current_user 
      redirect_to profile_url(params[:id]) 
      return
    end
    unless current_user.has_role?(:admin) && current_user == @user
      redirect_to profile_url(params[:id]) 
    end
  end
  
  private
  def dependency
    @cities = City.find(:all, :order => :name)
    @localities = Locality.find(:all)
  end
  
end
