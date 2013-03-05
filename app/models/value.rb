class Value < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :team_values
  has_many :teams, :through => :team_values
  has_many :evaluations
  accepts_nested_attributes_for :evaluations, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  #belongs_to :team
end
