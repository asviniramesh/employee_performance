class AddFrequencyToEvaluationFrequency < ActiveRecord::Migration
  def change
	add_column :evaluation_frequencies, :frequency, :string
  end
end
