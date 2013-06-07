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
  
  def employee_value_evaluation e, v
    Evaluation.where('employee_id = ? and value_id = ?', e,v)
  end
  
  def get_manager_score e, ev
     ev.evaluation_scores.where('evaluator_id == ?', e.id).first.blank? ? '--' : ev.evaluation_scores.where('evaluator_id == ?', e.id).first.points 
  end

	def employee_last_evaluation emp_id, val_id, period
			[Evaluation.where(:employee_id => emp_id, :value_id => val_id, :evaluation_period_id => period).order('updated_at').last].compact
		end
end



