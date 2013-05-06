class Recipient < ActiveRecord::Base
  attr_accessible :recipient_id, :resource_id, :resource_type
	belongs_to :resource, :polymorphic => true
	belongs_to :recipient_id, :class => 'employee'
end
