class CalendarsController < ApplicationController
  before_filter :authenticate_admin, only: [:create]

  def create
    @photographer = Photographer.find(params[:photographer_id])
    @photographer.create_calendar
    redirect_to @photographer
  end

  def update
    @calendar = Calendar.find(params[:id])
    @calendar.update_attributes(calendar_params)

    if @calendar
    	flash[:notice] = "Calendar Feed Updated"
    	redirect_to @calendar.photographer
    else

    end
  end

  private

  def calendar_params
    params.require(:calendar).permit(:feed)
  end

  def authenticate_admin
    if !(photographer_signed_in? && current_photographer.admin)
    	flash[:warning] = "You do not have permission to view this page."
      redirect_to root_path
    end
	end
end