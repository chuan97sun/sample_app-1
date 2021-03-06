class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create)
  before_action :load_user, except: %i(index new create)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy

  def index
    @users = User.sort_by_name.page params[:page]
  end

  def show
    @microposts = @user.microposts.paginate page: params[:page]
    @follow = current_user.active_relationships.build
    @unfollow = current_user.active_relationships.find_by followed_id: @user.id
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      @user.send_activation_email
      flash[:info] = t ".acct_info"
      redirect_to root_path
    else
      flash.now[:danger] = t ".fail_mess_create"
      render :new
    end
  end

  def update
    if @user.update user_params
      flash[:success] = t ".success_mess_update"
      redirect_to @user
    else
      flash.now[:danger] = t ".fail_mess_update"
      render :edit
    end
  end

  def edit; end

  def destroy
    if @user.destroy
      flash[:success] = t ".success_mess_delete"
    else
      flash[:warning] = t ".fail_mess_delete"
    end
    redirect_to users_path
  end

  def following
    @title = "Following"
    @user = User.following.page params[:id]
    render "show_follow"
  end

  def followers
    @title = "Followers"
    @user = User.followes.page params[:id]
    render "show_follow"
  end

  private

  def user_params
    params.require(:user).permit User::USERS_PARAMS
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:warning] = t "users.user_not_found"
    redirect_to root_path
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t "users.login_remind"
    redirect_to login_path
  end


  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_path unless current_user? @user
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
