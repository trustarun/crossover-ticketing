FactoryGirl.define do
  factory :user_type do
    name 'Customer'
    code 'CUSTOMER'
  end

  factory :user_type1, parent: :user_type do
    name 'Employee'
    code 'EMPLOYEE'
  end

  factory :user_type2, parent: :user_type do
    name 'Admin'
    code 'ADMIN'
  end
end

