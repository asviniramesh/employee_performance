class CreateEvaluationPeriods < ActiveRecord::Migration
  def change
    create_table :evaluation_periods do |t|
      t.time :eval_start_date
      t.time :eval_end_date
      t.integer :team_id
      t.timestamps
    end
  end
end
