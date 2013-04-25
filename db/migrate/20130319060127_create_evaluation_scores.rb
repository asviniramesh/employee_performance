class CreateEvaluationScores < ActiveRecord::Migration
  def change
    create_table :evaluation_scores do |t|
      t.integer :evaluator_id
      t.integer :submitter_id
      t.references :score, index: true
      t.references :evaluation, index: true

      t.timestamps
    end
  end
end
