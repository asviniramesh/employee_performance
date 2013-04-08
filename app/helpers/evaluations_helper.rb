module EvaluationsHelper
#	def full_name(object)
#		"#{object.employee.employee_detail.first_name} #{object.employee.employee_detail.last_name}".camelcase
#	end

  def commented_by s
    if Employee.find(s.object.evaluator_id).roles.map(&:name).include?('Manager')
    "Manager Comments"
    else
    "My Comments"
    end unless s.object.new_record?
  end

	def get_team_members_for evaluations
    team_members = []
    evaluations.each do |ev|
     team_members << ev.employee_id
    end
		team_members.uniq
	end
end



