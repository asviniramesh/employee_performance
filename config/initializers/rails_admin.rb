# RailsAdmin config file. Generated on March 20, 2013 09:40
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Live The Value', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_employee } # auto-generated

	config.authenticate_with do
		unless current_employee.roles.blank?
				redirect_to main_app.new_employee_session_path unless current_employee.roles.map(&:name).include?('Admin') 
		end
  end

# leave it to authorize
#  config.authorize_with do
#    redirect_to main_app.new_employee_session_path unless false
#  end

  # If you want to track changes on your models:
  # config.audit_with :history, 'Employee'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'Employee'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Employee', 'EmployeeDetail', 'EmployeeHierarchy', 'EmployeeHistory', 'EmployeeRole', 'Evaluation', 'EvaluationComment', 'EvaluationFrequency', 'EvaluationInterval', 'EvaluationPeriod', 'EvaluationScore', 'EvaluationStatus', 'EvaluationSummary', 'Role', 'Score', 'Team', 'TeamEmployee', 'Value']

  # Include specific models (exclude the others):
  # config.included_models = ['Employee', 'EmployeeDetail', 'EmployeeHierarchy', 'EmployeeHistory', 'EmployeeRole', 'Evaluation', 'EvaluationComment', 'EvaluationFrequency', 'EvaluationInterval', 'EvaluationPeriod', 'EvaluationScore', 'EvaluationStatus', 'EvaluationSummary', 'Role', 'Score', 'Team', 'TeamEmployee', 'Value']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]
end
