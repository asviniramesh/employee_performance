class Evaluation < ActiveRecord::Base
  belongs_to :employee
  belongs_to :value
  belongs_to :evaluation_period
  belongs_to :evaluation_status
  has_many :evaluation_scores
  accepts_nested_attributes_for :evaluation_scores
    attr_accessible  :evaluation_score_ids,:employee_id,:value_id, :evaluator_id, 
		:score_id, :submitter_id,:evaluation_scores,:evaluation_scores_attributes

  delegate :status, :to => :evaluation_status, :prefix => false, :allow_nil => true

  def set_status refer
		if refer
			self.evaluation_status_id = EvaluationStatus.find_by_status("Refer_To_Committe").id
		else
		 self.evaluation_status_id = self.evaluation_status_id == EvaluationStatus.find_by_status("Self_Evaluated").id ? EvaluationStatus.find_by_status("Manager_Evaluated").id : EvaluationStatus.find_by_status("Completed").id
		end
    self.save
  end
end
