class Admin::SettingsController < ApplicationController
	# list all the admin settings
	def index
		
	end

	# manage tickets
	# admin can change priority, status, assignment etc
	def tickets
		@tickets = Ticket.all
		respond_to do |format|
	      format.html
	      format.pdf do
	        pdf = ReportPdf.new(@tickets)
        	send_data pdf.render, filename: "ticket_report#{Time.now.strftime('%d-%m-%y')}.pdf", type: 'application/pdf'
	      end
	    end
	end

	# manage users
	# admin can create and delete user, assign role to them 
	def manage_users
		@users = User.all
	end

	# create user by admin as ajax request
	def create_user
		@user = User.new(user_params)
		temp_password = Devise.friendly_token
		@user.password = temp_password
		@user.password_confirmation = temp_password
		if @user.save
			@user_saved = true
			@user.add_role :support
		end
		@users = User.all
	end	

	private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :user_type_id, :mobile_no)
    end
end
