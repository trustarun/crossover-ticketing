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

  def full_name
    last_name.present? ? "#{first_name} #{last_name}" : first_name
  end

  # user_type like employee, vendor etc is set explicitly by admin
  # For user registration through devise, it will be empty, set it here
  def set_user_type
  	if self.user_type_id.blank?
  		self.user_type_id = 1
  	end
  end

end
