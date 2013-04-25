class EvaluationFrequency < ActiveRecord::Base
  attr_accessible :format, :start_date, :frequency ,  :evaluation_interval_ids

has_many :evaluation_intervals
end
