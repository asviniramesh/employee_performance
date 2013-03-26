class CreateEmployeeHistories < ActiveRecord::Migration
  def change
    create_table :employee_histories do |t|
      t.string :changed_column_name
      t.string :changed_table_name
      t.string :changed_value
      t.references :employee, index: true

      t.timestamps
    end
  end
end
