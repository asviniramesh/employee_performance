class EvaluationsController < ApplicationController
 #~ before_filter :values, :only => [:show, :edit, :update, :destroy]
	def index
		@evaluations=Evaluation.all
	end
	
	def new
		@team=TeamValue.where("team_id= ?",1)
		 @team.each do |a|
			@tea = a.value.description
			end
		@values = Value.all
		@managers = EmployeeHeirarchy.employees(current_user.id).collect{|employee| User.find(employee.manager_id)}
		@evaluation = Evaluation.new
	end
	
	def save_evaluations(params)
	
  	evaluation_records = params.select{|param| param.match(/^evaluation/)}
    
    value_ids = evaluation_records.keys.collect{|rec| rec.split("-")[2]}.uniq!
    @eval = Evaluation.new
    @saved = false
    
    value_ids.each do |item|
      
      evaluation_records.each do |evaluation|
        if evaluation.first.split("-")[2] == item 
          @eval[evaluation.first.split("-")[1]] = evaluation.last.split.join
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
      redirect_to :action => :edit
		else
			render :action => :new
		end  
	end
	
	def show
		@evaluations = Evaluation.where(:id => params[:id])
	end
	
	def edit
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
	
	#~ def values
		#~ @value=Evaluation.find(params[:id]).value.description
	#~ end
	
end
