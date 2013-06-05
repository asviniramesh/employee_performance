class EvaluationFrequencyValue < ActiveRecord::Base
  attr_accessible :evaluation_frequency_id, :value_id
  belongs_to :value
  belongs_to :evaluation_frequency
end
