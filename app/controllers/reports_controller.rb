class ReportsController < ApplicationController
  
  before_filter :require_admin
  
  def show
    @survey = Survey.find(params[:id])
    @res = @survey.questions.map { |q| { :question_id => q.id, :responses => q.responses.pluck(:answer_id) , :stats => [q.responses.pluck(:answer_id).uniq , q.responses.pluck(:answer_id).uniq.map { |r| q.responses.pluck(:answer_id).count(r) } , q.responses.pluck(:answer_id).uniq.map { |r| q.responses.pluck(:answer_id).count(r) * 1.0/q.responses.pluck(:answer_id).count * 100 }].transpose}}
    logger.info @res
  end
  
end
