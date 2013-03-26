class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :description
      t.integer :points
      t.references :employee, index: true

      t.timestamps
    end
  end
end
