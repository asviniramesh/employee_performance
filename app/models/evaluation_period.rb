class EvaluationPeriod < ActiveRecord::Base
	attr_accessible :evaluations_ids, :Final_eval_end_date
	  has_many :evaluations
		belongs_to :evaluation_intervals
end
