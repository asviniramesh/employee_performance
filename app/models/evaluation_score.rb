class EvaluationScore < ActiveRecord::Base
  belongs_to :score
  belongs_to :evaluation
  has_one :evaluation_comment
  accepts_nested_attributes_for :evaluation_comment
  attr_accessible :evaluator_id, :submitter_id, :score_id,
 :evaluation_id,:evaluation_comment_attributes
#	validates_presence_of :score_id
  validates :score_id, :presence => { :message => "Point is required" }
  
 delegate :points, :to => :score, :prefix => false, :allow_nil => true
end
