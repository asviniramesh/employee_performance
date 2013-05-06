require 'multiinsert'
class CommentsController < ApplicationController
	before_filter :find_comment
	def new
		@employee_profile = current_employee.employee_detail
		@values=Value.all
		@superior_ids = EmployeeHierarchy.all.map(&:superior_id).uniq
		@superior_employees = Employee.where(:id=>[@superior_ids]).index_by(&:id)
		@first_level_emp_ids =  EmployeeHierarchy.where("superior_id = ?",current_employee.id).map(&:employee_id)
		@first_level_records = Employee.where(:id=>[@first_level_emp_ids])
		@employee_detail = []
		@first_level_records.each do |k|
			@employee_detail << k.employee_detail
		end
		@comment = Comment.new
	end

	def create
		Multiinsert::SaveRecords.new.save(params[:comment],"comment","save")
	end

#	def list_comments
#	 this method will be useful to list the comments given by team lead for an employee
#	end

#	def destroy
#	 this method will be useful to destroy the comment
#	end

	def find_comment
    @find_comment =Employee.find(params[:employee_id])
  end
end
