class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :rememberable, :lockable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :slug, :first_name, :middle_initial, :last_name, :bio, :position, :remember_me, :avatar

  # Paperclip
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }

  has_many :posts
  validates_uniqueness_of :slug
  validates_presence_of :slug

  before_validation_on_create :set_slug

  scope :unlocked, where('locked_at IS NULL')

  def to_s
    "#{first_name} #{middle_initial} #{last_name}"
  end

  def name
    "#{first_name} #{last_name}"
  end

  def locked
    locked_at?
  end

  def set_slug
    unless slug
      self.slug = first_name.downcase + last_name.downcase
    end
  end

  def to_param
    slug
  end

end
