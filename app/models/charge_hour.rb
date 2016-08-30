class ChargeHour < ActiveRecord::Base
	belongs_to :user
	belongs_to :project
	belongs_to :period

	after_create :set_charge_rate
	after_create :set_charge_rate
	accepts_nested_attributes_for :period

	validates :user_id, presence: true
	validates :project_id, presence: true
	validates :hours, presence: true
	
	state_machine :state, :initial => :'等待审核' do
    event :confirm! do
      transition :'等待审核' => :'审核通过'
    end

    event :unconfirm! do
      transition :'等待审核' => :'审核拒绝'
    end

    event :redo! do
    	transition :'审核拒绝' => :'等待审核'
  	end
  end
	
	private
	def set_charge_rate
		self.charge_rate = self.user.charge_rate
		self.save
	end
end
