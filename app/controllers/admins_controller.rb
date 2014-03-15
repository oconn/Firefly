class AdminsController < ApplicationController
  before_filter :authenticate_admin

	def index

	end

	private

	def authenticate_admin
    redirect_to new_photographer_session_path if !(photographer_signed_in? && current_photographer.admin)
	end
end
