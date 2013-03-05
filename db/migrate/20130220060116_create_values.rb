class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.text :description
      t.text :title
      t.timestamps
    end
  end
end
