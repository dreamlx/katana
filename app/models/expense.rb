class Expense < ActiveRecord::Base
	has_one :expense_category
	belongs_to :project
	belongs_to :user
	belongs_to :period
	accepts_nested_attributes_for :period
end
