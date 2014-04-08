class BlogImagesController < ApplicationController
  before_filter :authenticate_admin

  def index
    @blog_images = BlogImage.all
  end

  def new
    @blog_image = BlogImage.new
  end

  def create
    @blog_image = BlogImage.new(blog_image_params)
    if @blog_image.save
      flash[:notice] = "Blog Image added"
      redirect_to blog_images_path
    else
      @errors = @blog_image.errors.messages
      render 'new'
    end
  end

  def destroy
    @blog_image = BlogImage.find(params[:id])
    @blog_image.destroy 
    flash[:notice] = "Image Removed"
    redirect_to blog_images_path
  end

  private
  
  def blog_image_params
    params.fetch(:blog_image, {}).permit(:image_path)
  end

	def authenticate_admin
    if !(photographer_signed_in? && current_photographer.admin)
    	flash[:warning] = "You do not have permission to view this page."
      redirect_to root_path
    end
	end
end