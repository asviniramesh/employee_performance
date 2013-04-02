class Evaluation < ActiveRecord::Base
  belongs_to :employee
  belongs_to :value
  belongs_to :evaluation_period
  belongs_to :evaluation_status
  has_many :evaluation_scores
  accepts_nested_attributes_for :evaluation_scores
    attr_accessible  :evaluation_score_ids,:employee_id,:value_id, :evaluator_id, 
		:score_id, :submitter_id,:evaluation_scores,:evaluation_scores_attributes
		



end
