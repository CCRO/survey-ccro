class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :person
  has_one :survey, :through => :question
  
  validate :valid_response
  
private
  def valid_response
      errors.add(:base, "Invalid response") unless self.question.possible_responses.include?(self.response)
  end
end
