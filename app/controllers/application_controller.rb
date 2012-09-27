class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def after_sign_in_path_for(resource)
  if current_user.email=="surveyor@bpe.com"
    surveyor_path
  else
    dashboard_path
  end

  end

end
