class AddEvaluationFrequencyIdColumnToEvaluationPeriod < ActiveRecord::Migration
  def change
		  add_column :evaluation_periods, :evaluation_frequency_id, :integer
  end
end
