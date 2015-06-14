# This is message model. It defines the basic properties of a messsage object.

# Note that does not create the messages table in the database, that is done through migration.

# This model defines a message's relationship to a user. However because a message
# has an author and an owner we have to define its relationship to user twice. Because
# we are saying messages belong to things which arent classes, we have to tell them what class
# these things are so ActiveRecord know how to query for them.

# This model validates that messages have a body. Messages without a body will not be able
# to be saved
class Message < ActiveRecord::Base

  belongs_to :owner, class_name: 'User'
  # <<< make another belongs_to for author that is attached to the "User class". Note punctuation and capitalization >>>

  validates :body, presence: true
end
