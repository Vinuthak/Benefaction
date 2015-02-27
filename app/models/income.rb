class Income < ActiveRecord::Base
	belongs_to :account
	validates :name, :presence => true
	validates_format_of(:name,{:with => /[A-Za-z]/,:if => Proc.new{|income| income.name.present?}})
	validates :amount,{:presence => true, :numericality => {:allow_blank => true} }


	def self.search(name,amount)
		conditions = []
		if name.present?
			conditions << "name LIKE '%#{name}%'"
	 	end
	 	if amount.present?
	 		conditions << "amount LIKE '%#{amount}%'"
	 	end

	 	query = Income.order("name")
	 	query = query.where(conditions.join(" AND ")) if conditions.size > 0
	 	query.all

	end 
end	