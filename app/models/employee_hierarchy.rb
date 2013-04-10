class EmployeeHierarchy < ActiveRecord::Base
	attr_accessible :superior_id, :hierarchy_order
  belongs_to :employee
	belongs_to :superior, :class_name => 'Employee', :foreign_key => 'superior_id'
end


