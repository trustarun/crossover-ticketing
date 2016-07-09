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
end
