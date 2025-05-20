class ApplicationController < ActionController::Base
 before_action :basic_auth
 before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_out_path_for(resource_or_scope)
    root_path
  end

 private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname, :last_name, :first_name,
      :last_name_kana, :first_name_kana, :birthday
    ])
  end
end
