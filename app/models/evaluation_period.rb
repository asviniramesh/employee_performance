class EvaluationPeriod < ActiveRecord::Base
	attr_accessible :evaluations_ids, :Final_eval_end_date, :final_eval_start_date, :manager_eval_end_date, :manager_eval_start_date, :self_eval_end_date, :self_eval_start_date, :evaluation_frequency_id
	  has_many :evaluations
		belongs_to :evaluation_intervals
		belongs_to :evaluation_frequency

  rails_admin do
    create do
      field :self_eval_start_date do
				label "Start Date"
			end
			field :self_eval_end_date do
				label "End Date"
			end
			field :evaluation_frequency_id do
				label "Evaluation Frequency"
			end
    end
		list do
			field :id do
				label "Id"
			end
		 	field :self_eval_start_date do
				label "Start Date"
			end
			field :self_eval_end_date do
				label "End Date"
			end
			field :evaluation_frequency_id do
				label "Evaluation Frequency"
			end
		end
  
	 	edit do
      field :self_eval_start_date do
				label "Start Date"
			end
			field :self_eval_end_date do
				label "End Date"
			end
			field :evaluation_frequency_id do
				label "Evaluation Frequency"
			end
    end
end
end
