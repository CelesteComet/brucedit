class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :get_columns, :current_user

  def get_columns(element, options)

    arr = element.attributes.keys[1..-4]

    options[:add].each do |el|
      arr << el
    end

    options[:remove].each do |el|
      arr.delete(el)
    end

    arr
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
end
