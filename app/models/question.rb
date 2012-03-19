class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers
  has_many :responses
  
  validates :prompt, :presence => true
end
