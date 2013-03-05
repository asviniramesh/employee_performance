class CreateIntervalFormats < ActiveRecord::Migration
  def change
    create_table :interval_formats do |t|
      #t.time :frequency

      t.timestamps
    end
  end
end
