class ChargeHour < ActiveRecord::Base
	belongs_to :user
	belongs_to :project
	belongs_to :period

	accepts_nested_attributes_for :period
end
