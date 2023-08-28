class UsersController < ApplicationController
  def index
    @users = User.includes(:posts)
  end

  def show
    @user = User.includes(posts: %i[comments likes]).find(params[:id])
  end
end
