class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource_or_scope)
      if resource.sign_in_count == 1
         new_profile_path
      else
         root_path
      end
  end

end
