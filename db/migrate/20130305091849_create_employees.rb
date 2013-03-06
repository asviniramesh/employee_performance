class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :user
      t.references :manager

      t.timestamps
    end
    add_index :employees, :user_id
    add_index :employees, :manager_id
  end
end
