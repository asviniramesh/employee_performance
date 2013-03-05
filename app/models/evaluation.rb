class Evaluation < ActiveRecord::Base
  attr_accessible :evaluation_period_id, :manager_comments, :manager_points, :self_comments, :self_points, :user_id, :value_id,:final_comments, :final_points
   belongs_to :user
   belongs_to :value, :autosave => true
    belongs_to :evaluation_periods
end
