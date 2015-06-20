class User < ActiveRecord::Base

  has_many :messages, foreign_key: 'author_id', inverse_of: :author, dependent: :destroy
  has_many :messages, foreign_key: 'owner_id', inverse_of: :owner, dependent: :destroy


  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
  validates :email, presence: true, uniqueness: true
end
