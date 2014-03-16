class UsersController < ApplicationController
  before_filter :authenticate_photographer!, only: [:index, :email]
  before_filter :check_privileges, only: [:edit_profile_image]

	def index
    @users = User.all.order(:last_name)
	end

	def show
    @user = User.find(params[:id])
	end

	def edit_profile_image
    @user = User.find(params[:id])
	end

	def update_profile_image
    @user = User.find(params[:id])
    @image = params[:profile_image][:profile_image] rescue nil

    if @image.nil?
      @errors = "A picture must be selected before uploading."
      render "edit_profile_image"
    else
	    @user.update_attribute(:profile_image, @image)
      flash[:notice] = "Profile Picture Updated."
      redirect_to @user
    end
	end

  def email
    @user = User.find(params[:id])
  end

	private
  
  def profile_image_params
    params.require(:profile_image).permit(:profile_image)
  end

	def check_privileges
	  if !((user_signed_in? && current_user.id == params[:id]) || photographer_signed_in? )
	  	flash[:warning] = "You do not have privileges to access this page"
	  	redirect_to root_path
	  end
	end
end
