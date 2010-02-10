class VideosController < ApplicationController
  
  def destroy
    @video = Video.find(params[:id])
    @video.destroy
  end
  
end
