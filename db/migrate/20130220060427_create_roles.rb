class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_description
      t.timestamps
    end
  end
end
