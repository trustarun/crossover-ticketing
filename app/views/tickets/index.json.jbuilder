json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :title, :description, :issuer_user_id, :assigned_to_id, :category_id, :status_id, :priority_id, :due_date
  json.url ticket_url(ticket, format: :json)
end
