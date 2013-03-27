class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource)
	  new_evaluation_path
  	#resource.roles.map(&:name).include?('Employee') ? rails_admin.dashboard_path : home_dashboard_path
  end
end
