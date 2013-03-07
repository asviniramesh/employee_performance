class AddmanageridToEvaluations < ActiveRecord::Migration
  def up
	  add_column :evaluations, :manager_id, :integer
  end

  def down
	  remove_column :evaluations, :manager_id, :integer
  end
end
