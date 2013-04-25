class CreateEvaluationSummaries < ActiveRecord::Migration
  def change
    create_table :evaluation_summaries do |t|
      t.integer :total_score
      t.references :employee, index: true

      t.timestamps
    end
  end
end
