class Bingo < ActiveRecord::Base
	belongs_to :account
	validates :firstname,:presence => :true
	validates :amount,:presence => true,:numericality => true
end
