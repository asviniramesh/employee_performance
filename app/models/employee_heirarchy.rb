class EmployeeHeirarchy < ActiveRecord::Base
  belongs_to :employee, :class_name => User, :foreign_key => 'employee_id'
  belongs_to :manager, :class_name => User, :foreign_key => 'manager_id'
end
