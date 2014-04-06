class PortfolioImagesController < ApplicationController
  before_filter :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @portfolio_images = PortfolioImage.all
  end

  def new
    @portfolio_image = PortfolioImage.new
  end

  def create 
    @portfolio_image = PortfolioImage.new(portfolio_image_params)
    if @portfolio_image.save 
      flash[:notice] = "Image added"
      redirect_to portfolio_images_path
    else
      @errors = @portfolio_image.errors.messages
      render 'new'
    end
  end

  def destroy
    @portfolio_image = PortfolioImage.find(params[:id])
    @portfolio_image.destroy
    flash[:notice] = "Image Removed"
    redirect_to portfolio_images_path
  end
  
  private

  def portfolio_image_params
    if params[:portfolio_image]
      params.require(:portfolio_image).permit(:image_path)
    end
  end

	def authenticate_admin
    if !(photographer_signed_in? && current_photographer.admin)
    	flash[:warning] = "You do not have permission to view this page."
      redirect_to root_path
    end
	end
end