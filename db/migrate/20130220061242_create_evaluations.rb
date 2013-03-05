class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :self_points
      t.integer :manager_points
      t.integer :final_points
      t.text :self_comments
      t.text :manager_comments
      t.text :final_comments
      t.integer :evaluation_period_id
      t.integer :value_id
      t.integer :user_id
      t.timestamps
    end
  end
end
