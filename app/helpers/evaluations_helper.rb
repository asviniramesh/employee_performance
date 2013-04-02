module EvaluationsHelper
	def full_name(object)
		"#{object.employee.employee_detail.first_name} #{object.employee.employee_detail.last_name}".camelcase
	end

  def commented_by s
    if Employee.find(s.object.evaluator_id).roles.map(&:name).include?('Manager')
    "Manager Comments"
    else
    "My Comments"
    end unless s.object.new_record?
  end

	def get_team_members
		EmployeeHierarchy.where("superior_id = ? ", current_employee.id).map(&:employee_id)
	end
end



