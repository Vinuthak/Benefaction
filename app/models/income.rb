class Income < ActiveRecord::Base
	belongs_to :account
	validates :name, :presence => true
	validates :amount, :numericality => true 
end
