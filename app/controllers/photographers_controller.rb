class PhotographersController < ApplicationController
  before_filter :authenticate_admin, only: [:index]
  before_filter :check_privileges, only: [:edit_profile_image, :update_profile_image]
  
	def index
    @photographers = Photographer.all.order(:created_at)
	end

	def show
    @photographer = Photographer.find(params[:id])
	end

	def edit_profile_image
    @photographer = Photographer.find(params[:id])
	end

	def update_profile_image
    @photographer = Photographer.find(params[:id])
    @image = params[:profile_image][:profile_image] rescue nil

    if @image.nil?
      @errors = "A picture must be selected before uploading."
      render "edit_profile_image"
    else
	    @photographer.update_attribute(:profile_image, @image)
      flash[:notice] = "Profile Picture Updated."
      redirect_to @photographer
    end
	end

	private

	def authenticate_admin
    if !(photographer_signed_in? && current_photographer.admin)
    	flash[:warning] = "You do not have permission to view this page."
      redirect_to root_path
    end
	end

	def check_privileges
	  if !((photographer_signed_in? && current_photographer.id == params[:id].to_i))
	  	flash[:warning] = "You do not have privileges to access this page"
	  	redirect_to root_path
	  end
	end
end