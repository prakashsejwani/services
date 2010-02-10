class ImagesController < ApplicationController
  
   def destroy
     @image = Image.find(params[:id])
    @image.destroy
    asset = @image.asset
    @allowed = 5 - asset.images.count
  end
  
end
