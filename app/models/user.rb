class User < ActiveRecord::Base

	has_many :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 	validates :name, presence: true
	validates :charge_rate, numericality: true


end
