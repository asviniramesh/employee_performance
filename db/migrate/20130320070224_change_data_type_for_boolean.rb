class ChangeDataTypeForBoolean < ActiveRecord::Migration
  def up
  change_column :evaluation_frequencies, :format, :float
  end

  def down
  end
end
