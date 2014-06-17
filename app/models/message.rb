# this is message model. It defines the basic properties of a messsage object. Note that
# does not create the messages table in the database, that is done through migration.
# This model simply defines a message's relationship to a user. However because a message
# has an author and an owner we have to define its relationship to user twice. Becaause
# we are saying messages belong to things which arent classes, we have to tell them what class
# these things are so ActiveRecord know how to query for these things.
# This model validates the messages have a body. Messages without a body will not be able
# to be saved
class Message < ActiveRecord::Base

  belongs_to :owner, class_name: 'User'
  belongs_to :author, class_name: 'User'

  validates :body, presence: true
end
