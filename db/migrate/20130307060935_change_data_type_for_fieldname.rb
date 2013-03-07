class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def up
    change_table :evaluation_intervals do |t|
      t.change :frequency, :string
    end
  end

  def down
    change_table :tablename do |t|
      t.change :frequency, :time
    end
  end
end
