FactoryGirl.define do
  factory :user do
    first_name 'arun'
    last_name  'yadav'
    email 'trust@yahoo.co.in'
    password 'happyarun'
    password_confirmation 'happyarun'
    user_type_id 3
    mobile_no 9569806453
  end

  factory :user1, parent: :user do
    first_name 'Santosh'
    last_name  'yadav'
    email 'santosh@gmail.com'
    user_type_id 1
  end

  factory :user2, parent: :user do
    first_name 'kapil'
    last_name  'yadav'
    email 'kapil@gmail.com'
    user_type_id 2
  end

  factory :user3, parent: :user do
    first_name 'Pankaj'
    last_name  'arora'
    email 'pankaj@gmail.com'
    user_type_id 2
  end

  factory :user4, parent: :user do
    first_name 'karan'
    last_name  'ahjua'
    email 'karan@gmail.com'
    user_type_id 2
  end
end