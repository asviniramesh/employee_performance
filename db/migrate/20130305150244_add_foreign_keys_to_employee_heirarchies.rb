class AddForeignKeysToEmployeeHeirarchies < ActiveRecord::Migration
  def change
    add_foreign_key(:employee_heirarchies, :users, column: 'employee_id')
    add_foreign_key(:employee_heirarchies, :users, column: 'manager_id')
  end
end
