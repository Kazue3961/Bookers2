class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

#ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
		user_path(current_user.id)
	end
#ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    root_path
  end

  add_flash_types :success, :info

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :username, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
