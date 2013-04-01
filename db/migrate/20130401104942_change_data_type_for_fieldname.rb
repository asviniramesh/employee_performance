class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def self.up
 		change_table :scores do |t|
      t.change :points, :string
    end
  end

  def self.down
		 change_table :scores do |t|
      t.change :points, :integer
    end
  end
end
