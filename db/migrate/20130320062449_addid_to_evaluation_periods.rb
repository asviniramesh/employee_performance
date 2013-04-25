class AddidToEvaluationPeriods < ActiveRecord::Migration
  def up
	      add_column :evaluation_periods, :evaluation_interval_id, :integer
  end

  def down
  end
end
