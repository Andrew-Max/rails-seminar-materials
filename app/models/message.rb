class Message < ActiveRecord::Base

  belongs_to :owner, class_name: 'User'
  belongs_to :author, class_name: 'User'

  validates :body, presence: true
end
