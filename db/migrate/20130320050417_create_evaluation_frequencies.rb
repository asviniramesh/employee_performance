class CreateEvaluationFrequencies < ActiveRecord::Migration
  def change
    create_table :evaluation_frequencies do |t|
      t.boolean :format
      t.date :start_date

      t.timestamps
    end
  end
end
