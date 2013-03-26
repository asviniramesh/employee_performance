class CreateTeamEmployees < ActiveRecord::Migration
  def change
    create_table :team_employees do |t|
      t.references :employee, index: true
      t.references :team, index: true

      t.timestamps
    end
  end
end
