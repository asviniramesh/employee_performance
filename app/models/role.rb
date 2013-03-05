class Role < ActiveRecord::Base
  attr_accessible :role_description
  #~ has_many :users
  has_many :user_roles
  has_many :users, :through => :user_roles

end
