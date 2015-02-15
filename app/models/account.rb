class Account < ActiveRecord::Base
	has_many :users
	has_many :incomes
	has_many :expenses
	has_one :bingo, through: :users
	validates(:name, :presence => true)#validates is a method with symbol name and hash as two parameters.
	validates_format_of(:name,
		{
			:with => /[A-Za-z]/,# value is a // regular exprssion
			:if => Proc.new {|account| account.name.present?}# value is a block-Proc.new is the way to create a block{}
		})
	validates :registration_number,	 
		{
			:presence => "true",
			:numericality => { :allow_blank => "true" } 
		}
end
	



	 
