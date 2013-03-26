class EvaluationInterval < ActiveRecord::Base
 attr_accessible :evaluation_period_ids
  belongs_to :evaluation_frequency
  belongs_to :value
has_many :evaluation_periods
end
