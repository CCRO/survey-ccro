class Survey < ActiveRecord::Base
  has_many :questions
  has_many :responses, :through => :questions
  has_many :users, :through => :responses, :uniq => true
  
  validates :name, :presence => true
end
