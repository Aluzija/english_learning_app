class Words::LearningSessionController < ApplicationController
  before_action :delete_uncompleted, only: :create

  def create
    @to_learn_words = Word.order(:id).limit(params[:how_many])
    words_ids = Array.new(@to_learn_words.map { |word| word.id })
    @session = Words::LearningSession.new(words_ids: words_ids, user_id: params[:user_id])
    @session.save
    redirect_to question_type_1_user_packet_words_learning_session_path(id: @session.id)
  end


  def question_type_1
    # @similar_words = Array.new(@to_learn_words.map { |word| word.similar })
  end

  private

  def delete_uncompleted
    uncomplited = Words::LearningSession.where(completed: false)
    uncomplited.each {|u| u.destroy}
  end

end
