UserType.create([
                  { name: 'Customer', code: 'CUSTOMER' },
                  { name: 'Employee', code: 'EMPLOYEE' },
                  { name: 'Admin', code: 'ADMIN' }
                ])


Status.create([
                  { name: 'UnAssigned', code: 'UNASSIGNED' },
                  { name: 'Assigned', code: 'ASSIGNED' },
                  { name: 'InProgress', code: 'INPROGRESS' },
                  { name: 'Resolved', code: 'RESOLVED' },
                  { name: 'Reopen', code: 'REOPEN' }
                ])

Category.create([
                  { name: 'Software', code: 'SOFTWARE' },
                  { name: 'Hardware', code: 'HARDWARE' },
                  { name: 'Billing', code: 'BILLING' },
                  { name: 'Payment', code: 'PAYMENT' },
                ])

Role.create([
                  { name: 'manager' },
                  { name: 'technical_architect' },
                  { name: 'hr' },
                  { name: 'finanace' },
                ])

admin_type_id = UserType.find_by(code: "ADMIN").id
@admin = User.create(
                  { email: "takeeasylookbusy@gmail.com", first_name: "arun", 
                  	last_name: "singh", mobile_no: "9569806453", user_type_id: admin_type_id,
                  	password: "happyarun", password_confirmation: "happyarun"
                  }
                )

@admin.add_role :admin
