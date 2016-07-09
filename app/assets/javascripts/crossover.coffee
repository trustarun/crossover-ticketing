$(document).ready ->
  if $('#new_user').length > 0
    validate_user_registration()


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