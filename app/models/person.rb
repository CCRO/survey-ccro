class Person < ActiveRecord::Base
  
  has_many :answers
  has_many :questions, :through => :answers
  has_many :surveys, :through => :questions
  
end
