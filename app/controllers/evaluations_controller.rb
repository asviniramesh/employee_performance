class EvaluationsController < ApplicationController
	
 autocomplete :employee_detail, :first_name
  before_filter :authenticate_employee!
	
	def index
		@evaluation=Evaluation.all
	end
	
	def new
		@employee_profile = current_employee.employee_detail
		@values=Value.all
		self_evaluated_status_id = EvaluationStatus.find_by_status('Self_Evaluated').id
                @evaluated_values = []
		Value.all(:include => :evaluations).each do |v|
#    e = Evaluation.find_by_value_id_and_employee_id_and_evaluation_status_id(v.id, current_employee.id, self_evaluated_status_id)
     e = v.get_current_evaluations current_employee
    unless e.evaluation_scores.map(&:submitter_id).blank?
      @evaluated_values << v 
   end if e
   end unless @values.blank?
   @values = Value.where('id NOT IN (?)',@evaluated_values) if @evaluated_values.present?
    @scores = Score.all
		@managers=current_employee.employee_hierarchies.map(&:superior_id)
	  @employee = current_employee.id
		@evaluation = Evaluation.new
    i= @evaluation.evaluation_scores.build
    i.build_evaluation_comment

	#manager review part
  evs = []
  Evaluation.where('evaluation_status_id = ?', self_evaluated_status_id).each do |ev|
   ev.evaluation_scores.each do |es|
     evs << es if es.submitter_id == current_employee.id 
   end if check_condition(ev)
  end
   
	@manager_review_values = [] 
  @manager_review_evaluations = []
  evs.each do |s|
     v = s.evaluation.value
   unless s.evaluation.evaluation_scores.count == 2
	 j = s.evaluation.evaluation_scores.build
	 j.build_evaluation_comment
  end
	@manager_review_evaluations << s.evaluation
	@manager_review_values << v
  end unless evs.blank?
	#current_employee.get_manager_reviewed_evaluations 

evs1 = []
Evaluation.where('evaluation_status_id = ? and employee_id = ?',EvaluationStatus.find_by_status('Manager_Evaluated').id,current_employee.id).each do |ev|
   ev.evaluation_scores.each do |es|
     evs1 << es if es.submitter_id == current_employee.id 
   end 
  end
   
	@employee_review_values = [] 
  @employee_review_evaluations = []
  evs1.each do |s|
  v = s.evaluation.value
	@employee_review_evaluations << s.evaluation
	@employee_review_values << v
  end unless evs1.blank?
	end
	
	def create
	@values=Value.all
    @scores = Score.all
		@evaluation = Evaluation.new(params[:evaluation])
    @evaluation.evaluation_status_id = EvaluationStatus.find_by_status('Self_Evaluated').id
		@managers=current_employee.employee_hierarchies.map(&:superior_id)
	  @employee = current_employee.id
		if @evaluation.save
    flash[:notice] = 'Your value was successfully created.'
			redirect_to :action=> :new
		else
			redirect_to :action=> :new
		end
	end
	
	def show
		@evaluation = Evaluation.find(params[:id])
	end
	
	def edit
		@evaluation = Evaluation.find(params[:id])
	end
	
	def update
		@evaluation = Evaluation.find(params[:id])
		if @evaluation.update_attributes(params[:evaluation])
      @evaluation.set_status refer = params.has_key?('refer') ? true : false
			redirect_to :action=> :new
		else
			redirect_to :action=> :new
		end
	end
	
	def destroy
		@evaluation = Evaluation.find(params[:id])
		@evaluation.destroy
	end

	def check_condition ev
		if current_employee.roles.map(&:name).include?('Manager')
			ev.evaluation_scores.count == 1
		else
			true
	end 
end

		def test_report
			if params[:date]
				month = "0" + params[:date][:month] 
				@dates = []
				EvaluationPeriod.all.map(&:self_eval_start_date).each do |a|
					d = a.strftime("%m")
					if d == month 
						@dates << a
					end
				end
			end
			@eval_periods = EvaluationPeriod.where(:self_eval_start_date => @dates)
			@employee_profile = current_employee.employee_detail
			@values=Value.all
			@superior_ids = EmployeeHierarchy.all.map(&:superior_id).uniq
			@superior_employees = Employee.where(:id=>[@superior_ids]).index_by(&:id)
			@first_level_emp_ids =  EmployeeHierarchy.where("superior_id = ?",current_employee.id).map(&:employee_id)
			if params[:first_name]
				@first_level_records =  EmployeeDetail.search(params[:first_name]).map(&:employee).index_by(&:id)
				@master_record_set = @first_level_records
			else
				@first_level_records = Employee.where(:id=>[@first_level_emp_ids]).index_by(&:id)
				@master_record_set = {current_employee.id => @first_level_emp_ids.blank? ? current_employee : @first_level_records }
			end
			@first_level_records.each_pair do |key,value|
				@first_key = key
				@second_level_emp_ids = EmployeeHierarchy.where(:superior_id => key).map(&:employee_id)
				@second_level_records = Employee.where(:id=>[@second_level_emp_ids]).index_by(&:id)
				puts @second_level_emp_ids
				if params[:first_name]
					@master_record_set[@first_level_records.keys.first] = @second_level_records if @second_level_records.present?
				else
					@master_record_set[current_employee.id][key] = @second_level_records if @second_level_records.present?
				end
				@second_level_records.each_pair do |key,value|
					@third_level_emp_ids = EmployeeHierarchy.where(:superior_id => key).map(&:employee_id)
					@third_level_records = Employee.where(:id=>[@third_level_emp_ids]).index_by(&:id)

				if params[:first_name]
					@master_record_set[@first_level_records.keys.first][key] = @third_level_records if @third_level_records.present?
				else
					@master_record_set[current_employee.id][@first_key][key] = @third_level_records if @third_level_records.present?
				end
				end
			end
		end
	
	def team
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
	end

	def employee_profile
		@employee_profile = current_employee.employee_detail
	end
	 
end
