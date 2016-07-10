class UsersController < ApplicationController
	# return list of emploee to populate xeditable select
	# for ticket assignment
	def index
		employee_type_id = UserType.find_by(code: "EMPLOYEE").id
		@users = User.where(user_type_id: employee_type_id)
	end
end
