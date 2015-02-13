class Expense < ActiveRecord::Base
	belongs_to :account
	validates :amount, :numericality => true
end
