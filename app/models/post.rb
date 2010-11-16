class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :body, :user_id, :slug
  validates_uniqueness_of :slug
  validates_format_of :slug, :with => /^[a-zA-Z0-9\-]+$/, :message => " can only contain letters, numbers, and dashes."

  # TODO validate title is all characters
  validates_uniqueness_of :title
  scope :for_user, lambda{ |user| where('user_id = ?', user.id)}

  def to_param
    self.slug
  end
end
