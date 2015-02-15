class Expense < ActiveRecord::Base
	belongs_to :account
	validates :amount, :presence => true,:numericality => {:allow_blank => true}
end
