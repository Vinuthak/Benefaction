class Bingo < ActiveRecord::Base
	belongs_to :account
	validates :firstname,:presence => :true
	validates_format_of :firstname,:with => /[A-Za-z]/,:if => Proc.new{|bingo| bingo.firstname.present?}
	validates :amount,:presence => true,:numericality => {:allow_blank => true}
end