module ApplicationHelper
	def message_type(name)
	    set_name = name.present? ? name.to_s : ""
	    case set_name
	    when "notice"
	      "success"
	    when "error"
	      "error"
	    when "info"
	      "info"
	    when "alert"
	      "alert"
	    else
	      "success"
	    end
	 end

	# show first employee as default selection for assigning ticket
	# through xeditable UI
	def default_assigned_user(ticket)
		ticket.assigned_to_id.present? ? ticket.assigned_to_id : (User.find_by(user_type_id: 2).try(:id))
	end
end
