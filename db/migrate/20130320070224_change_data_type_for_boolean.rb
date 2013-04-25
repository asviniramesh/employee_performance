class ChangeDataTypeForBoolean < ActiveRecord::Migration
  def up
  change_column :evaluation_frequencies, :format, :string
  end

  def down
  end
end
