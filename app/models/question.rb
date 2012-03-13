class Question < ActiveRecord::Base
  
  has_one :answer
  belongs_to :survey
  has_many :people, :through => :answers
  
  serialize :possible_responses
  
end
