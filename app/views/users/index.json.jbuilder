json.array!(@users) do |user|
  json.value user.id
  json.text user.full_name
end