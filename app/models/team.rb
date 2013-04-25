class Team < ActiveRecord::Base
	has_many :team_employees
	has_many :employees, :through => :team_employees
	
end
