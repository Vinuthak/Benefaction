class Account < ActiveRecord::Base
	has_many :users
	has_many :incomes
	has_many :expenses
	has_one :bingo, through: :users
	validates :name, :presence => true
	validates :registration_number, :numericality => true 
	validates :registration_number, :presence => true
	



	 
end
