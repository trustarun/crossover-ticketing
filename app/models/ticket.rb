class Ticket < ActiveRecord::Base
	belongs_to :user, foreign_key: 'issuer_user_id'
	belongs_to :assigned_user, class_name: 'User', foreign_key: 'assigned_to_id'
	belongs_to :priority
	belongs_to :status
	belongs_to :category
	validates :title, :description, :issuer_user_id, presence: true
	before_save :set_defaults

	# set default value for tickets
	def set_defaults
		unassigned_status_id = Status.find_by(code: 'UNASSIGNED').try(:id)
		priority_id = Priority.find_by(code: 'LOW')
		category_id = Category.find_by(code: 'OTHER')
		self.status_id = unassigned_status_id if self.status_id.blank?
		self.priority_id = priority_id if self.priority_id.blank?
		self.category_id = category_id if self.category_id.blank?
	end
end
