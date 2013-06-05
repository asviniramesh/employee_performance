class EvaluationFrequency < ActiveRecord::Base
  attr_accessible :format, :start_date, :frequency ,  :evaluation_interval_ids
  has_many :evaluation_intervals
	has_many :evaluation_frequencies
  has_many :evaluation_frequency_values
  has_many :values, :through =>:evaluation_frequency_values
end
