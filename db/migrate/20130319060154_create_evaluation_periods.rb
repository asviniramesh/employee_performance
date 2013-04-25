class CreateEvaluationPeriods < ActiveRecord::Migration
  def change
    create_table :evaluation_periods do |t|
      t.date :final_eval_end_date
      t.date :final_eval_start_date
      t.date :manager_eval_end_date
      t.date :manager_eval_start_date
      t.date :self_eval_end_date
      t.date :self_eval_start_date

      t.timestamps
    end
  end
end
