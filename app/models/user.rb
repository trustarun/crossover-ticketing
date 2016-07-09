class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    last_name.present? ? "#{first_name} #{last_name}" : first_name
  end

  before_save :set_user_type

  # user_type like employee, vendor etc are set explicitly by admin
  # For user registration through devise, it will be empty, set it here
  def set_user_type
  	if self.user_type_id.blank?
  		self.user_type_id = 1
  	end
  end

end
