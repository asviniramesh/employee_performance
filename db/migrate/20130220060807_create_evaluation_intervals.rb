class CreateEvaluationIntervals < ActiveRecord::Migration
  def change
    create_table :evaluation_intervals do |t|
      t.integer :team_id
       t.time :frequency
      t.timestamps
    end
  end
end
