class Message < ActiveRecord::Base

  belongs_to :owner, class_name: 'User'
  has_one :author

  validates :body, presence: true
end
