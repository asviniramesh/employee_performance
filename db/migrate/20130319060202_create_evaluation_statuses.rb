class CreateEvaluationStatuses < ActiveRecord::Migration
  def change
    create_table :evaluation_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
