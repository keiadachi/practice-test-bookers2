class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!, except: [:top, :about]
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  #deviseが使われる前に以下の内容が実行される

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email]) 
    #登録に必要なのはemail
  end
  
end
