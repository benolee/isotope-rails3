class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :body
  scope :for_user, lambda{ |user| where('user_id = ?', user.id)}
end
