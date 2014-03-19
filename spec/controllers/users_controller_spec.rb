require 'spec_helper'

describe UsersController do
	context "prevents a user from" do
		it "accessing the index" do
	    visit users_path
	    current_path.should == '/photographers/sign_in'
		end

		
	end

end
