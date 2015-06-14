# This is user model. It defines the basic properties of a user object.

# Note that does not create the users table in the database, that is done through migrations.

# This model defines a users's relationship to a message. However because a user can either
# be an author or an owner we have to define its relationship to message twice. Because
# messages will now have two user fields we have to give each user a distinct foreign key which links
# it to a user for that property.

# The inverse_of property (eg "inverse_of: :author") adds helper methods to the model so we can now say @message.author or @message.owner.

# "dependant: destroy" say that if the user that has these messages is destroyed, the messages
# should be destroyed as well.

# This model validates the users have a name and email, that the email is unique and that the name is the
# right length. It will not be able to be saved if any of those conditions are not met.

# in the same way that you can validate
# presence: true
# you can also validate for uniqueness
# uniqueness: true

class User < ActiveRecord::Base

  has_many :messages, foreign_key: 'author_id', inverse_of: :author, dependent: :destroy
  # <<< make an identical has_many relationship for 'owner_id' >>>


  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
  # <<< validate that email is present and unique >>>
end
