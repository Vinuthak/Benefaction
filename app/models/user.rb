class User < ActiveRecord::Base
  belongs_to :account
  has_one :bingo
  validates :firstname, :place, :presence => true
  
end
