class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :body, :user_id
  # TODO validate title is all characters
  validates_uniqueness_of :title
  scope :for_user, lambda{ |user| where('user_id = ?', user.id)}
end
