module ApplicationHelper
  def login_helper
    if request.env['PATH_INFO'] != ('/login' || '/sign_up')
      if current_user.is_a?(User)
        link_to "Logout", destroy_user_session_path, method: :delete
      else
        (link_to "Register", new_user_registration_path ) +
        "<br>".html_safe +
        (link_to "Login", new_user_session_path)
      end
    end
  end

  def greetings_helper
    "Hi, #{current_user.name}".html_safe if current_user
  end


end
