class EvaluationInterval < ActiveRecord::Base
  attr_accessible :frequency, :team_id
  belongs_to :team
end
