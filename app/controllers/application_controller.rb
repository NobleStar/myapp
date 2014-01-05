class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private
    def after_sign_in_path_for(resource)
     # After you enter login info and click submit, I want to show home/index.html
     home_path
    end

    def after_sign_out_path_for(resource_or_scope)
     new_user_session_path
end

end
