class UserHistory < ActiveRecord::Base
  attr_accessible :date, :evaluation_period_id, :team_id, :totalpoints, :user_id,:manager_id
  belongs_to :team
  belongs_to :user
  belongs_to :evaluation_period
end
