class Admin::SettingsController < ApplicationController
	# list all the admin settings
	def index
		
	end

	# manage tickets
	# admin can change priority, status, assignment etc
	def tickets
		@tickets = Ticket.all
	end
end
