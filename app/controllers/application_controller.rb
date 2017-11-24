class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    user_packets_path(current_user.id)
  end

  def to_boolean(str)
    str == "true"
  end

end
