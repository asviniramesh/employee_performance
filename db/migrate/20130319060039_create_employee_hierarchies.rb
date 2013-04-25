class CreateEmployeeHierarchies < ActiveRecord::Migration
  def change
    create_table :employee_hierarchies do |t|
      t.integer :hierarchy_order
      t.integer :superior_id
      t.references :employee, index: true

      t.timestamps
    end
  end
end
