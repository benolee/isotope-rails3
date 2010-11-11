class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :rememberable, :lockable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :bio, :position, :remember_me

  # Paperclip
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  has_many :posts

  def to_s
    "#{first_name} #{middle_initial} #{last_name}"
  end

  def name
    "#{first_name} #{last_name}"
  end

end
