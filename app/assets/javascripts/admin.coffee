$(document).ready ->
	$.fn.editable.defaults.ajaxOptions = type: 'PUT'
	if $('#admin-ticket-listing').length > 0
		initialize_tickets_editable()

  if $('#my_ticket_listing_container').length > 0    
     $('.ticket_status_update').editable {}
    
	if $('#admin-user-listing').length > 0
		initialize_users_datatable()
		new_user_model()
		$('.user_role_update').editable {}
	return

initialize_tickets_editable = ->
  $('.ticket_status_update').editable {}  
  $('.ticket_assigned_update').editable {}
  $('.ticket_priority_update').editable {}
  $('.ticket_category_update').editable {}    
  return

initialize_users_datatable = ->
  nEditing = null
  # initialize datatable for library type
  oTable = $('#datatable-editable_users').dataTable(
    'sPaginationType': 'full_numbers'
    aoColumnDefs: [ {
      bSortable: false
      aTargets: [
        1
        -1
      ]
    } ])
  # delete library type
  $('#datatable-editable_users').on 'click', 'a.delete-row', (e) ->
    confirmed = confirm('Are you sure?')
    if confirmed
      e.preventDefault()
      nRow = $(this).parents('tr')[0]
      oTable.fnDeleteRow nRow
      $.ajax
        type: 'DELETE'
        url: "/admin/delete_user/"+$(this).data('user_id')+".js"      
        contentType: 'script'
    return
  return

new_user_model = ->
  $('#admin_create_user').on 'click', ->
    $('#new_user_modal').modal 'show'    
    return
  $('.cancel_user_creation').on 'click', ->    
    $('#new_user_modal').modal 'hide'
    $('#user_title').val("")
    $('#user_description').val("")
  return
