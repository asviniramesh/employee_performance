class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.integer :resource_id
      t.string :resource_type
      t.integer :recipient_id

      t.timestamps
    end
  end
end
