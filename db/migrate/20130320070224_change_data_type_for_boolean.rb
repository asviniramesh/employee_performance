class ChangeDataTypeForBoolean < ActiveRecord::Migration
  def up
  change_column :evaluation_frequencies, :format, :decimal
  end

  def down
  end
end
