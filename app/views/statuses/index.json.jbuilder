json.array!(@statuses) do |status|
  json.value status.id
  json.text status.name
end
