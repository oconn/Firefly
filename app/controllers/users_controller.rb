class UsersController < ApplicationController
  before_filter :authenticate_photographer!, only: [:index]
  
	def index
    @users = User.all.order(:last_name)
	end
end
