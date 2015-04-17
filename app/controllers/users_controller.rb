class UsersController < ApplicationController
  before_action :set_user, only: %i(show)
  skip_before_action :verify_authenticity_token, only: [:show]

  def index
    @users = User.all
  end

  def show
    @post = @user.posts.last
  end

  def update
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

end
