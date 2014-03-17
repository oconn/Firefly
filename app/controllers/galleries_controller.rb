class GalleriesController < ApplicationController
  before_filter :authenticate_photographer!, only: [:new, :create, :destroy]
  before_filter :check_privileges, only: [:index]
  before_filter :check_gallery_permissions, only: [:show]
  
	def new
    @gallery = Gallery.new
    @user = User.find(params[:user_id])
	end

	def create
    @user = User.find(params[:user_id])
    @gallery = @user.galleries.new(gallery_params)
    
    if @gallery.save
      flash[:notice] = "Gallery: '#{@gallery.name}' has been created."
      redirect_to @gallery
    else
      @errors = @gallery.errors.messages
      render "new"
    end
	end
  
	def show
    @gallery = Gallery.find(params[:id])
    @images = @gallery.images
    @image = Image.new
    @user = User.find(@gallery.user.id)
	end

	def index
    @user = User.find(params[:user_id])
    @galleries = @user.galleries
	end

  def destroy
    @gallery = Gallery.find(params[:id])
    @user = @gallery.user
    @gallery.delete
    flash[:notice] = "Gallery '#{@gallery.name}' has been removed"
    redirect_to user_galleries_path(@user)
  end

	private

	def gallery_params
    filtered_params = params.require(:gallery).permit(:name, :cover_image)
    photographer = {photographer_id: current_photographer.id}
    filtered_params.merge photographer
	end

  def check_privileges
    if !((user_signed_in? && current_user.id == params[:user_id].to_i) || photographer_signed_in? )
      flash[:warning] = "You do not have privileges to access this page"
      redirect_to root_path
    end
  end

  def check_gallery_permissions
    @gallery = Gallery.find(params[:id])
    if !((user_signed_in? && current_user.id == @gallery.user.id) || photographer_signed_in? )
      flash[:warning] = "You do not have privileges to access this gallery. Contact the owner and ask for permission to access it."
      redirect_to root_path
    end
  end
end
