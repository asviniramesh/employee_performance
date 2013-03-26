class Score < ActiveRecord::Base
  belongs_to :employee
  has_many :evaluation_scores
end
