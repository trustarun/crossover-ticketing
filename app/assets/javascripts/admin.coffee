$(document).ready ->
	$.fn.editable.defaults.ajaxOptions = type: 'PUT'
	if $('#admin-ticket-listing').length > 0
		initialize_tickets_editable()
	return

initialize_tickets_editable = ->
  $('.ticket_status_update').editable {}
  return