class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #CSRF対策(Webサイトの脆弱性をつくようなサイバー攻撃)
  before_action :current_user

  def about
  end

  def contact
  end

  private

  def current_user
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
  end
end
