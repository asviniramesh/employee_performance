class CreateEmployeeHeirarchies < ActiveRecord::Migration
  def self.up
    create_table :employee_heirarchies do |t|
      t.timestamps
      t.integer :employee_id
      t.integer :manager_id
    end
  end
  
  def self.down
    drop_table :employee_heirarchies
  end
end
