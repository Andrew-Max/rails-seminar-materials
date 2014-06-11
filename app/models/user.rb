class User < ActiveRecord::Base

  has_many :messages

  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
  validates :email, presence: true, uniqueness: true
end
