class UsersController < ApplicationController
  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      flash[:user] = user
      flash[:error_messages] = user.errors.full_messages
      redirect_back fallback_location: 'http://localhost'
    end
  end

  def me
  end

  def show
  @user = User.find(params[:id])
  end

  def edit
  @user = @current_user
  end

  def update
    user = @current_user
    if user.update(user_params)
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      flash[:error_messages] = user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :faculty, :profile)
  end
end