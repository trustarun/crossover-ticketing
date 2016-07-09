class Ticket < ActiveRecord::Base
	belongs_to :user, foreign_key: 'issuer_user_id'
	validates :title, :description, :issuer_user_id, presence: true
end
