class ApplicationController < ActionController::Base
#   protect_from_forgery with: :exception
# #   before_action :authenticate_user! # 追記 (userの部分はmodel名)
# before_action :configure_permitted_parameters, if: :devise_controller?

# protected
# # def devise_parameter_sanitizer
# #     if resource_class == User
# #       User::ParameterSanitizer.new(User, :user, params)
# #     else
# #       super # Use the default one
# #     end
# # end

# def configure_permitted_parameters
#   devise_parameter_sanitizer.permit(:sign_up, keys: [:prefecture])
#   devise_parameter_sanitizer.permit(:account_update, keys: [:prefecture])
#   devise_parameter_sanitizer.permit(:sign_in, keys: [:prefecture])
# end
before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
  attributes = [:prefecture]
  devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  devise_parameter_sanitizer.permit(:account_update, keys: attributes)
end

end
