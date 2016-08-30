class Project < ActiveRecord::Base
	
	has_many :bookings # first booking is owner, todo
	has_many :charge_hours
	has_many :expenses
	has_one :contract
	belongs_to :client
	belongs_to :owner, class_name: User
	belongs_to :billing_responsibility_user, class_name: User

	validates :title, presence: true
	#todo: 
	#has_many :billings
	#
	
	accepts_nested_attributes_for :contract, reject_if: :all_blank, allow_destroy: true

  state_machine :state, :initial => :'项目开始' do
    event :closed! do
      transition [nil, :'项目开始'] => :'项目关闭'
    end

    event :redo! do
    	transition [nil, :'项目关闭'] => :'项目开始'
  	end
  end
	
end
