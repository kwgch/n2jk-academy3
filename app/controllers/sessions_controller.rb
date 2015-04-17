class SessionsController < ApplicationController

  def new
    redirect_to '/auth/github'
  end

  def create
    auth = request.env["omniauth.auth"]
    logger.info auth.to_yaml
    user = User.find_by(github_id: auth[:uid]) || User.create_by_github(auth)
    user.update(auth_hash: auth)
    sign_in(user)
    redirect_to root_url
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
