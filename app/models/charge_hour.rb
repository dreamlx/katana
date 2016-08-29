class ChargeHour < ActiveRecord::Base
	belongs_to :booking
	belongs_to :project
	belongs_to :period

	after_create :set_charge_rate
	after_create :set_charge_rate
	accepts_nested_attributes_for :period

	validates :booking_id, presence: true
	validates :project_id, presence: true
	validates :hours, presence: true
	

	private
	def set_charge_rate
		self.charge_rate = self.booking.charge_rate
		self.save
	end
end
