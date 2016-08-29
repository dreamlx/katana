class Expense < ActiveRecord::Base
	belongs_to :expense_category
	belongs_to :project
	belongs_to :user
	belongs_to :period
	accepts_nested_attributes_for :period

	validates :user_id, presence: true
	validates :project_id, presence: true
	validates :amount, presence: true
end
