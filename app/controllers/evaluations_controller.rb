class EvaluationsController < ApplicationController
 #~ before_filter :values, :only => [:show, :edit, :update, :destroy]
	def index
		@evaluations=Evaluation.all
	end
	
	def new
		#@managers =  User.where("role_id = ?", 2)
		@values = Value.all
		@evaluation = Evaluation.new
	end
	
	def create
 	        @evaluation=current_user.evaluations.new(params[:evaluation])
		if @evaluation.save
			render :action => :show
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
