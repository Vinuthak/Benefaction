class Income < ActiveRecord::Base
	belongs_to :account
	validates :name, :presence => true
	validates_format_of(:name,{:with => /[A-Za-z]/,:if => Proc.new{|income| income.name.present?}})
	validates :amount,{:presence => true, :numericality => {:allow_blank => true} } 
end	