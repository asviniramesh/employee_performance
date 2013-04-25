class CreateEvaluationIntervals < ActiveRecord::Migration
  def change
    create_table :evaluation_intervals do |t|
      t.references :evaluation_frequency, index: true
      t.references :value, index: true

      t.timestamps
    end
  end
end
