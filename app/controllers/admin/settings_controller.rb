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
end
