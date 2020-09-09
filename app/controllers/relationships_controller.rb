class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def index
    @user = User.find_by id: params[:id] || params[:followed_id]
    redirect_to root_path unless @user

    @title = t ".#{params[:type]}"
    @users = @user.send(params[:type]).page(params[:page]).per Settings.collections.follower_default_page
    render "users/show_follow"
  end

  def create
    @user = User.find_by id: params[:followed_id]
    if @user
      current_user.follow @user
      respond_to :js
    else
      flash[:warning] = t "microposts.not_found"
      redirect_to root_path
    end
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed
    current_user.unfollow @user
    respond_to :js
  end
end
