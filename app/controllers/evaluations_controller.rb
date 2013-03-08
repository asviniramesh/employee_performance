class EvaluationsController < ApplicationController
 #~ before_filter :values, :only => [:show, :edit, :update, :destroy]
	def index
		@evaluations=Evaluation.all
	end
	
	def new

	@period=current_user.team
		@interval=@period.evaluation_intervals.each do |l|
    @check = l.frequency
    end
			 @interval.each do |e|
				@menu = e.id
			 end
		@ep = EvaluationPeriod.new
		@ep.eval_start_date = Date.today.at_beginning_of_month
		@ep.eval_end_date = Date.today.at_end_of_month
		@ep.team_id = @period.id
		@ep.evaluation_interval_id = @menu
   


		@values = Value.all
		@managers = EmployeeHeirarchy.employees(current_user.id).collect{|employee| [User.find(employee.manager_id).firstname,User.find(employee.manager_id).id]}
		@evaluation = Evaluation.new
	end
	
	def save_evaluations(params)
  	evaluation_records = params.select{|param| param.match(/^evaluation/)}
			evaluation_records.each do |evaluation|
			evaluation.first.split("-")[1] == "manager_id"
			@manager_id = evaluation.last.split.join
		end
    value_ids = evaluation_records.keys.collect{|rec| rec.split("-")[2]}.uniq!
    @eval = Evaluation.new
    @saved = false
    value_ids.each do |item|
      evaluation_records.each do |evaluation|
        if evaluation.first.split("-")[2] == item 
          @eval[evaluation.first.split("-")[1]] = evaluation.last.split.join
          @eval["manager_id"] = @manager_id
        else
          break if !@saved
        end        
      end
      saved = @eval.save
      @eval = Evaluation.new
      @saved = true
      saved
    end
  
	end
	
	def create
	  
	 if save_evaluations(params)
      render :action => :modify
		else
			render :action => :new
		end  
	end
	
	def show
		@evaluations = Evaluation.where(:id => params[:id])
	end
	
	def modify
   @evaluations = Evaluation.where(:user_id => current_user.id)
	end
	
	def update
		@evaluation = Evaluation.find(params[:id])
		if @evaluation.update_attributes(params[:evaluation])
			render :action => :show
		else
			render :action => :edit
		end
	end
	
	def destroy
		@evaluation = Evaluation.find(params[:id])
		@evaluation.destroy
	end
	
	def first
	end
	
end
