class User < ActiveRecord::Base
  rolify
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email, :mobile_no, :user_type_id, presence: true
  validates :email, uniqueness: true

  before_save :set_user_type

  belongs_to :user_type
  has_many :tickets, foreign_key: 'issuer_user_id', dependent: :destroy

  def full_name
    last_name.present? ? "#{first_name} #{last_name}" : first_name
  end

  # user_type like employee, vendor etc is set explicitly by admin
  # For user registration through devise, it will be empty, set it here
  def set_user_type
  	if self.user_type_id.blank?
  		customer_type_id = UserType.find_by(code: "CUSTOMER").id
  		self.user_type_id = customer_type_id
  	end
  end

  # customer tickets are based on issuer_user_id
  # employee tickets are based on assigned_to_id
  def my_tickets
    if self.user_type_id == 1
      Ticket.where(issuer_user_id: self.id)
    else
      Ticket.where(assigned_to_id: self.id)
    end
  end

end
