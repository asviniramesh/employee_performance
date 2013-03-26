class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :get_layout
  
  def after_sign_in_path_for(resource)
	  new_evaluation_path
  	#resource.roles.map(&:name).include?('Employee') ? rails_admin.dashboard_path : home_dashboard_path
  end
  
  def get_layout
  	if devise_controller? && resource_name == :employee && action_name == 'new'
      "wizard"
    else
      "default"
    end
  end
  
end
