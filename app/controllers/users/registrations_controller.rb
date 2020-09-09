# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create, :update]

  # def create
  #   @user = User.new(configure_permitted_parameters)
    
  #   if @user.save
  #     WelcomeMailer.with(user: @user).welcome_email.deliver_now
  #     redirect_to '/', notice: 'User was successfully created.'
  #   end
  # end
 
  private
  # 在 devise 中加入 name & username 欄位
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :name, :username, :about, :password])
  end

  # update 的時候不需要驗證密碼
  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end
end