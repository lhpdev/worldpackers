module ApplicationHelper
  def login_helper
    if current_user.is_a?(User)
      link_to "Logout", destroy_user_session_path, method: :delete
    end
  end

  def greetings_helper
    "Hi, #{current_user.name}".html_safe if current_user
  end
end