class Value < ActiveRecord::Base

  has_many :evaluations
  has_many :evaluation_intervals

  def get_current_evaluations employee
   self.evaluations.where('employee_id = ? and created_at >= ? and created_at < ?', employee.id, Time.parse('2013-05-25'), Time.parse('2013-06-07')).first
  end
end
