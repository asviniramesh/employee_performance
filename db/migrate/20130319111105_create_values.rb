class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
