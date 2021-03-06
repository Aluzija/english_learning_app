class Words::LearningSessionController < ApplicationController
  before_action :delete_uncompleted, only: :create

  def create
    available_words = Word.where(learning_session_id: nil, packet_id: params[:packet_id])
    if available_words.count < params[:how_many].to_i || params[:how_many].to_i <= 0
      redirect_to packet_words_too_many_path(params[:packet_id])
    else
      words_to_learn = Word.order(:id).where(learning_session_id: nil, packet_id: params[:packet_id]).limit(params[:how_many])
      words_ids = Array.new(words_to_learn.map { |word| word.id })
      session = Words::LearningSession.new(words_ids: words_ids, user_id: current_user.id)
      session.save
      redirect_to question_type_1_words_learning_session_path(id: session.id, index: 0, type: 1)
    end
  end

  def question_type_1
    session = Words::LearningSession.find(params[:id])
    @answer = session.words[params[:index].to_i]
    similar_words = @answer.similar
    @words = [@answer, *similar_words]
    # @words.concat(@similar_words)
    @words.shuffle!
    if params[:type] == "3"
      render "question_type_3"
    end
  end

  def question_type_2
    session = Words::LearningSession.find(params[:id])
    @answer = session.words[params[:index].to_i]
    wrong_words = Word.where("id <> ? AND packet_id = ?", @answer.id,
    @answer.packet_id).select(:polish).distinct.limit(3)
    @words = [@answer, *wrong_words]
    @words.shuffle!
  end

  def question_type_4
    session = Words::LearningSession.find(params[:id])
    @answer = session.words[params[:index].to_i]
  end

  def question_type_5
    session = Words::LearningSession.find(params[:id])
    @answer = session.words[params[:index].to_i]
  end

  def manager
    session = Words::LearningSession.find(params[:id])
    index = params[:index].to_i
    type = params[:type].to_i
    word = session.words[index]
    correctness = to_boolean(params[:correctness])

    if correctness
      session.good_answers[type] << word.id
      Words::Repetition.new(packet_id: word.packet_id, word_id: word.id, next_rep: Date.today + 3).save! if type == 5
    else
      session.wrong_answers[type] << word.id
      Words::Repetition.new(packet_id: word.packet_id, word_id: word.id, next_rep: Date.today + 1).save! if type == 5
    end

    session.save

    if index == session.words.length - 1
      type += 1
      index = -1
    end

    case type
    when 1
      redirect_to question_type_1_words_learning_session_path(params[:id], index: index + 1, type: type)
    when 2
      redirect_to question_type_2_words_learning_session_path(params[:id], index: index + 1, type: type)
    when 3
      redirect_to question_type_1_words_learning_session_path(params[:id], index: index + 1, type: type)
    when 4
      redirect_to question_type_4_words_learning_session_path(params[:id], index: index + 1, type: type)
    when 5
      redirect_to question_type_5_words_learning_session_path(params[:id], index: index + 1, type: type)
    else
      session.completed = true
      session.words.each do |word|
        word.learning_session_id = session.id
        word.save!
      end
      session.save!
      redirect_to packet_words_path(Words::LearningSession.packet(params[:id]))
    end
  end

  private

  def delete_uncompleted
    uncomplited = Words::LearningSession.where(completed: false)
    uncomplited.each {|u| u.destroy}
  end

end
