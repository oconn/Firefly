class ImagesController < ApplicationController
  before_filter :authenticate_photographer!, only: [:create, :destroy]
  
  def create 
    @gallery = Gallery.find(params[:gallery_id])
    @user = @gallery.user
    @image = @gallery.images.new(image_params)

    if @image.save
      flash[:notice] = "Image added"
      redirect_to @gallery
    else
    	@errors = @image.errors.messages
    	render template: "galleries/show"
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy 
    @image = Image.find(params[:id])
    @gallery = @image.gallery
    @image.delete
    flash[:notice] = "Image Removed"
    redirect_to @gallery
  end

  private

  def image_params 
  	if params[:image]
	    params.require(:image).permit(:image_path)
	  end
  end
end
