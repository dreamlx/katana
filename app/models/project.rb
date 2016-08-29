class Project < ActiveRecord::Base
	
	has_many :bookings # first booking is owner, todo
	has_many :charge_hours, through: :bookings
	has_many :expenses, through: :bookings
	has_one :contract
	belongs_to :client
	belongs_to :owner, class_name: User
	belongs_to :billing_responsibility_user, class_name: User
	
	validates :job_code, presence: true
	validates :title, presence: true
	#todo: 
	#has_many :billings
	#
	
	accepts_nested_attributes_for :contract, reject_if: :all_blank, allow_destroy: true
end
