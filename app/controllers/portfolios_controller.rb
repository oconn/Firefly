class PortfoliosController < ApplicationController
  before_filter :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @portfolios = Portfolio.all
    @photographers = Photographer.all
  end
  
  def new 
    @photographer = Photographer.find(params[:photographer_id])
    @photographer.build_portfolio.save
    flash[:notice] = "Portfolio created for #{@photographer.full_name}"
    redirect_to portfolios_path
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @portfolio_image = PortfolioImage.new
    @images = @portfolio.portfolio_images

    render 'portfolios/show', layout: false if request.xhr?
  end

  private

	def authenticate_admin
    if !(photographer_signed_in? && current_photographer.admin)
    	flash[:warning] = "You do not have permission to view this page."
      redirect_to root_path
    end
	end
end