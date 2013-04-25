class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.references :employee, index: true
      t.references :value, index: true
      t.references :evaluation_period, index: true
      t.references :evaluation_status, index: true

      t.timestamps
    end
  end
end
