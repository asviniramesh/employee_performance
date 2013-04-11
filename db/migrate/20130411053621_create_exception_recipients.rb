class CreateExceptionRecipients < ActiveRecord::Migration
  def change
    create_table :exception_recipients do |t|
      t.string :email

      t.timestamps
    end
  end
end
