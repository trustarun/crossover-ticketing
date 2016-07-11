FactoryGirl.define do
  factory :ticket do
    title 'MyString'
    description 'MyText'
    issuer_user_id 1
    assigned_to_id 1
    category_id 1
    status_id 1
    priority_id 1
    due_date '2016-07-09 14:41:57'
  end
end
