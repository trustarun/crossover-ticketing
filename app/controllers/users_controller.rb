class UsersController < ApplicationController
	# return list of emploee to populate xeditable select
	# for ticket assignment
	def index
		employee_type_id = UserType.find_by(code: "EMPLOYEE").id
		@users = User.where(user_type_id: employee_type_id)
	end

	def update_role
		user = User.find(params[:id])
		role = Role.find(params[:value]).try(:name)
		user.roles.each do |role|
			user.remove_role role
		end
		user.add_role role
		render json: {msg: "success"}
	end
end
