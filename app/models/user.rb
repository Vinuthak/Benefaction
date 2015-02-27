class User < ActiveRecord::Base
  belongs_to :account
  has_one :bingo
  validates_format_of(:firstname,{:with => /[A-Za-z]/,:if => Proc.new{|user| user.firstname.present?}})
  validates(:firstname, :place, :presence => true)
  validates_format_of :place,{:with => /[A-Za-z]/,:if => Proc.new{|user| user.place.present?}}


  def self.search(first_name, place)
  	conditions = []

  	if first_name.present?
  		conditions << "firstname LIKE '%#{first_name}%'"
  	end

  	if place.present?
  		conditions << "place LIKE '%#{place}%'"
  	end

  	query = User.order("firstname")
  	query = query.where( conditions.join(" AND ") ) if conditions.size > 0
  	query.all

  	#self.where('firstname Like ? or place Like ?',"%#{search}%", "%#{search}%")
  end
end
