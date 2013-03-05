class CreateUserHistories < ActiveRecord::Migration
  def change
    create_table :user_histories do |t|
      t.integer :team_id
      t.integer :user_id
      t.integer :evaluation_period_id
      t.time :date
      t.integer :totalpoints
      t.integer :manager_id
      t.timestamps
    end
  end
end
