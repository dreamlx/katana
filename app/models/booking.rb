class Booking < ActiveRecord::Base
	belongs_to :project
	belongs_to :users

	state_machine :initial => :enabled do
    event :disable! do
      transition [nil, :enabled ] => :disabled
    end

    event :ensable! do
      transition [nil, :disabled ] => :enabled
    end
  end
end
