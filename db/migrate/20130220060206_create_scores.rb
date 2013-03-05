class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :level
      t.text :description
      t.timestamps
    end
  end
end
