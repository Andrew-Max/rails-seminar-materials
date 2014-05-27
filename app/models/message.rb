class Message < ActiveRecord::Base

  belongs_to :user, inverse_of: :messages
end
