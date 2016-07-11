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
                  { name: 'Other', code: 'OTHER' }
                ])

Role.create([
                  { name: 'manager' },
                  { name: 'technical_architect' },
                  { name: 'support' },
                  { name: 'hr' },
                  { name: 'finanace' }
                ])

Priority.create([
                  { name: 'Low', code: 'LOW' },
                  { name: 'Medium', code: 'MEDIUM' },
                  { name: 'High', code: 'HIGH' },
                  { name: 'Critical', code: 'CRITICAL' }
                ])

admin_type_id = UserType.find_by(code: "ADMIN").id
@admin = User.create(
                  { email: "takeeasylookbusy@gmail.com", first_name: "arun", 
                  	last_name: "singh", mobile_no: "9569806453", user_type_id: admin_type_id,
                  	password: "happyarun", password_confirmation: "happyarun"
                  }
                )

@admin.add_role :admin

@user = User.create(
                  { email: "ajay@yahoo.co.in", first_name: "ajay", 
                    last_name: "kumar", mobile_no: "9569806453", user_type_id: 1,
                    password: "happyarun", password_confirmation: "happyarun"
                  }
                )

@employee1 = User.create(
                  { email: "kapil@gmail.com", first_name: "kapil", 
                    last_name: "handa", mobile_no: "9569806453", user_type_id: 2,
                    password: "happyarun", password_confirmation: "happyarun"
                  }
                )

@employee1.add_role :manager

@employee2 = User.create(
                  { email: "priya@gmail.com", first_name: "priya", 
                    last_name: "yadav", mobile_no: "9569806453", user_type_id: 2,
                    password: "happyarun", password_confirmation: "happyarun"
                  }
                )

@employee2.add_role :hr

@employee3 = User.create(
                  { email: "priya@gmail.com", first_name: "priya", 
                    last_name: "yadav", mobile_no: "9569806453", user_type_id: 2,
                    password: "happyarun", password_confirmation: "happyarun"
                  }
                )

@employee3.add_role :support

Ticket.create([
{title: "Install Ubuntu", description: "Need recent version of Ubuntu on my system", priority_id: 1, status_id: 1, category_id: 1, issuer_user_id: @user.id},
{title: "Mouse not working", description: "Provide me new mouse", priority_id: 1, status_id: 1,category_id: 2, issuer_user_id: @user.id},
{title: "Mobill bill not paid", description: "I could not able to pay my mobile bill online", priority_id: 1, status_id: 1, category_id: 3, issuer_user_id: @user.id}
])