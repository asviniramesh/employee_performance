class EmployeeHierarchy < ActiveRecord::Base
  belongs_to :employee
	belongs_to :superior, :class_name => 'Employee', :foreign_key => 'superior_id'
end
