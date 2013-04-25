class EmployeeDetail < ActiveRecord::Base
  belongs_to :employee

def self.search(search)
  if search
    find(:all, :conditions => ['first_name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

end
