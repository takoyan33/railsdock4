class SessionsController < ApplicationController
  def create
    #ログイン処理
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      render 'home/index'
    end
  end

  def destroy
    #ログアウト処理
    session.delete(:user_id)
    redirect_to root_path
  end
end
