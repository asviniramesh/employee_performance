class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
 
  # attr_accessible :title, :body
  
  has_many :employee_roles
  has_many :roles, :through => :employee_roles
  has_many :employee_histories
  has_one  :employee_detail
  has_many :employee_hierarchies
  has_many :evaluations
  has_one  :evaluation_summary

  attr_accessible :email, :password, :password_confirmation, :remember_me, :employee_role_ids, :role_ids, 								  :employee_history_ids, :employee_detail_attributes, :evaluation_ids, :evaluation_summary_attributes, 
                  :employee_hierarchies_attributes

  attr_accessor   :password_token
 
  accepts_nested_attributes_for :employee_detail, :employee_hierarchies, :evaluation_summary, :allow_destroy => true
  
  #before_validation :generate_password, :on => :create
  after_create :set_superior_id

  def get_manager_reviewed_evaluations
    @manager_reviewed_evaluations = self.evaluations.where('evaluation_status_id = ?', EvaluationStatus.find_by_status('Manager_Evaluated').id)
	end
  
  def name
    if self.employee_detail.present?
  	  self.employee_detail.first_name + " " + self.employee_detail.last_name unless self.employee_detail.first_name.blank?
    end
  end

	def set_superior_id
		if self.roles.map(&:name).include?('Admin')
			emp_hierarchy = self.employee_hierarchies.new
			emp_hierarchy.superior_id = self.id
			emp_hierarchy.save
		end 
	end

  rails_admin do
    create do
      field :email
			field :password
			field :password_confirmation
      field	:employee_detail
      field :roles
      field :employee_hierarchies
    end
  end

  private
  def generate_password
    generated_password = Devise.friendly_token.first(8)
    self.password = generated_password
    self.password_confirmation = generated_password
    self.password_token = generated_password
  end

end


