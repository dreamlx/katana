class Project < ActiveRecord::Base
	
	has_many :bookings # first booking is owner, todo
	has_many :charge_hours
	has_many :expenses
	has_one :contract
	belongs_to :client
	belongs_to :owner, class_name: User

	validates :client, presence: true
	validates :owner, presence: true
	validates :start_date, presence: true
	validates :job_code, presence: true
	validates :title, presence: true
	#todo: 
	#has_many :billings
	#
	#accepts_nested_attributes_for :client, reject_if: :all_blank, allow_destroy: true
end
