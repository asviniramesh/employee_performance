class EvaluationComment < ActiveRecord::Base
  belongs_to :evaluation_score
	attr_accessible :comment,:evaluation_score_id
	#validates_presence_of :comment
end
