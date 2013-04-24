module SessionsHelper
  def login(user)
    session[:current_user_id] = user.id
  end

  def login?
    current_user ? true : false
  end

  def current_user
    @current_user ||= User.find_by_id(session[:current_user_id])
  end

  def logout
    session.delete(:current_user_id)
  end
end
