$(document).ready ->
  if $('#new_user').length > 0
    validate_user_registration()

  if $('#add_new_ticket').length > 0
    new_ticket_model()

  if $('#datatable-editable_tickets').length > 0
    initialize_tickets_datatable()


validate_user_registration = ->
  $('#new_user').formValidation
    framework: 'bootstrap'
    icon:
      valid: 'fa fa-check'
      invalid: 'fa fa-times'
      validating: 'fa fa-refresh'
    fields:
      'user[first_name]': validators: notEmpty: message: 'First name is required.'
      'user[last_name]': validators: notEmpty: message: 'Last name is required.'
      'user[mobile_no]': validators: notEmpty: message: 'Mobile number is required.'
      'user[email]': validators: notEmpty: message: 'Email is required.'
      'user[password]': validators: notEmpty: message: 'Password is required.'
      'user[password_confirmation]': validators: notEmpty: message: 'Password confirmation is required.'
  return

initialize_tickets_datatable = ->
  $('#datatable-editable_tickets').dataTable(
    'sPaginationType': 'full_numbers'
    aoColumnDefs: [ {
      bSortable: false
      aTargets: [
         1
        -1
      ]
    } ])
  return  

new_ticket_model = ->
  $('#add_new_ticket').on 'click', ->
    $('#new_ticket_modal').modal 'show'
    return
  $('.cancel_ticket_creation').on 'click', ->
    $('#new_ticket_modal').modal 'hide'
    return
  return