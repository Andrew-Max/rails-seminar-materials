module ApplicationHelper
  def gravatar_link(user)
    link_to gravatar_for(user), user_path(user)
  end
end
