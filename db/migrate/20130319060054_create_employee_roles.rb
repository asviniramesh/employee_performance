class CreateEmployeeRoles < ActiveRecord::Migration
  def change
    create_table :employee_roles do |t|
      t.references :employee, index: true
      t.references :role, index: true

      t.timestamps
    end
  end
end
