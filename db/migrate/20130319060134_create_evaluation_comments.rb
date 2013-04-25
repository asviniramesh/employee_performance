class CreateEvaluationComments < ActiveRecord::Migration
  def change
    create_table :evaluation_comments do |t|
      t.text :comment
      t.references :evaluation_score, index: true

      t.timestamps
    end
  end
end
