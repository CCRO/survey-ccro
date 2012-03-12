class Question < ActiveRecord::Base
  
  serialize :possible_responses
  
  belongs_to :survey
  has_many :answers
  has_many :people, :through => :answers
end
