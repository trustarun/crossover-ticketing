class TicketSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :issuer_user_id, :assigned_to_id, :category_id, :status_id, :priority_id, :due_date
end
