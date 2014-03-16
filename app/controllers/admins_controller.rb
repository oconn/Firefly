class AdminsController < ApplicationController
  before_filter :authenticate_admin

	def index

	end

	private

	def authenticate_admin
    if !(photographer_signed_in? && current_photographer.admin)
    	flash[:warning] = "You do not have permission to view this page."
      redirect_to root_path
    end
	end
end
