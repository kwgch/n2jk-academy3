class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def authenticate_user!
    redirect_to root_url, alert: 'ログインしてください' unless user_signed_in?
  end

end
