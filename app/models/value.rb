class Value < ActiveRecord::Base
		  has_many :evaluations
		  has_many :evaluation_intervals
end
