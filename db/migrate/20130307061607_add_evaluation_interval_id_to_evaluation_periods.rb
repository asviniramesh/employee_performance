class AddEvaluationIntervalIdToEvaluationPeriods < ActiveRecord::Migration
  def change
	   add_column :evaluation_periods, :evaluation_interval_id, :integer
  end
end
