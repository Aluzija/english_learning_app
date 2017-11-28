class Words::LearningSessionController < ApplicationController
  before_action :delete_uncompleted, only: :create

  def create
    @words_to_learn = Word.order(:id).limit(params[:how_many])
    words_ids = Array.new(@words_to_learn.map { |word| word.id })
    @session = Words::LearningSession.new(words_ids: words_ids, user_id: params[:user_id])
    @session.save
    redirect_to question_type_1_user_packet_words_learning_session_path(id: @session.id, index: 0)
  end


  def question_type_1
    @session = Words::LearningSession.find(params[:id])
    @words = @session.words
    @word = @words[params[:index].to_i]
    @similar_words = @word.similar
  end

  private

  def delete_uncompleted
    uncomplited = Words::LearningSession.where(completed: false)
    uncomplited.each {|u| u.destroy}
  end

end
