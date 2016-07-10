json.array!(@roles) do |role|
  json.value role.id
  json.text role.name
end
