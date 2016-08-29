class Booking < ActiveRecord::Base

	belongs_to :project
	belongs_to :member, class_name: 'User'
  has_many :expenses
  has_many :charge_hours
  before_create :setup_charge_rate
  validates :member_id, presence: true, uniqueness: {scope: :project, message: 'should booking once per project'}
  validates :project, presence: true
  validates :charge_rate, presence: true
	state_machine :initial => :actived do
    event :block! do
      transition [nil, :actived ] => :blocked
    end

    event :active! do
      transition [nil, :blocked ] => :actived
    end
  end

  def title
    self.member.name
  end

  private
  def setup_charge_rate
    unless self.charge_rate
      charge_rate = self.member.charge_rate
    end
  end
end
