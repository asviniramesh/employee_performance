class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :phonenum, :address, :team_id, :role_id, :evaulation
  belongs_to :team
  belongs_to :role
  has_many :evaluations
  has_many :user_histories
  #~  attr_accessible :title, :body

  accepts_nested_attributes_for :evaluations

 has_many :subordinates, :class_name => "User", :foreign_key => "manager_id"
 belongs_to :manager, :class_name => "User"

scope :managers, :conditions => { :role_id => 2 }
end
