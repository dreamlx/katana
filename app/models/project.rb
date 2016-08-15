class Project < ActiveRecord::Base
	
	has_many :bookings # first booking is owner, todo
	has_many :charge_hours
	has_many :expenses
	has_one :contract
	has_one :client
	has_one :owner, class_name: User, :foreign_key => 'owner_id'
	#todo: 
	#has_many :billings
	#
	accepts_nested_attributes_for :client
end
