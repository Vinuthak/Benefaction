class User < ActiveRecord::Base
  belongs_to :account
  has_one :bingo
  validates_format_of(:firstname,{:with => /[A-Za-z]/,:if => Proc.new{|user| user.firstname.present?}})
  validates(:firstname, :place, :presence => true)
  validates_format_of :place,{:with => /A-Za-z/,:if => Proc.new{|user| user.place.present?}}
end
