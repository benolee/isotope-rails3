class ContactForm < ActiveRecord::Base
  validates_presence_of :email
end

