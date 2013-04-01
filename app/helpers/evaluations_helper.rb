module EvaluationsHelper
	def full_name(object)
		"#{object.employee.employee_detail.first_name} #{object.employee.employee_detail.last_name}".camelcase
	end
end
