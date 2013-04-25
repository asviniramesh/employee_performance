class RemoveColumns < ActiveRecord::Migration
  def up
	    remove_column :scores, :employee_id
  end

  def down
  end
end
