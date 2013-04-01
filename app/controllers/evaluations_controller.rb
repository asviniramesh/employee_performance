class EvaluationsController < ApplicationController
	#~ def dashboard
	#~ end
	
	def index
		@evaluation=Evaluation.all
	end
	
	def new
		@values=Value.all
    @evaluated_values = []
		@values.each do |v|
    e = Evaluation.find_by_value_id_and_employee_id(v.id, current_employee.id)
    unless e.evaluation_scores.map(&:submitter_id).blank?
      @evaluated_values << v 
   end if e
   end
   @values = Value.where('id NOT IN (?)',@evaluated_values) if @evaluated_values.present?
    @scores = Score.all
		@managers=current_employee.employee_hierarchies.map(&:superior_id)
	  @employee = current_employee.id
		@evaluation = Evaluation.new
    i= @evaluation.evaluation_scores.build
    i.build_evaluation_comment

	#manager review part
  evs = []
  Evaluation.where('evaluation_status_id = ?',EvaluationStatus.find_by_status('Self_Evaluated').id).each do |ev|
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
			render :action => :new
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
			redirect_to :action=> :new
		else
			render :action => :edit
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


	def employee_profile
		@employee_profile = current_employee.employee_detail
	end
	
end
