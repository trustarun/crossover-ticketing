json.array!(@priorities) do |priority|
  json.value priority.id
  json.text priority.name
end
