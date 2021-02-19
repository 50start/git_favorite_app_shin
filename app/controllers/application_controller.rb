class ApplicationController < ActionController::Base
     before_action :configure_permitted_parameters, if: :devise_controller?
     def after_sign_in_path_for(resource) 
          user_path
     end
     def after_sign_up_path_for(resource)
          user_path
     end
     
     def after_sign_out_path_for(resource_or_scope)
          new_user_session_path #ログアウトしたらログイン画面に遷移する
     end
     
     protected
     def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
     end
end