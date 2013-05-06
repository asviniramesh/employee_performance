class Comment < ActiveRecord::Base
  attr_accessible :comment, :employee_id
	belongs_to :employee
	has_many  :recipients, :as => :resource
end
