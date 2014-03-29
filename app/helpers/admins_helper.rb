module AdminsHelper

	def total_users
    User.all.count
	end

	def total_staff
		Photographer.all.count
	end
end
