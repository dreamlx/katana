class Expense < ActiveRecord::Base
	belongs_to :expense_category
	belongs_to :project
	belongs_to :user
	belongs_to :period
	accepts_nested_attributes_for :period

	validates :user_id, presence: true
	validates :project_id, presence: true
	validates :amount, presence: true

	state_machine :state, :initial => :'等待审核' do
    event :confirm! do
      transition [nil, :'等待审核'] => :'审核通过'
    end

    event :unconfirm! do
      transition [nil, :'等待审核'] => :'审核拒绝'
    end

    event :redo! do
    	transition [nil, :'审核拒绝'] => :'等待审核'
  	end
  end
	
end
