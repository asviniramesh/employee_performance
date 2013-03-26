class CreateEmployeeDetails < ActiveRecord::Migration
  def change
    create_table :employee_details do |t|
      t.string :designation
      t.string :email
      t.string :first_name
      t.string :last_name
      t.date :joining_date
      t.string :mobile_num
      t.string :phone_num
      t.references :employee, index: true

      t.timestamps
    end
  end
end
