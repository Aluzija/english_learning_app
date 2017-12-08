class Words::RepetitionController < ApplicationController

  def index
    repetitions = Words::Repetition.where("next_rep" => Date.today.to_s)
    repetition = repetitions.first
    correctness = to_boolean(params[:correctness])

    repetition.rep += 1 if correctness
    repetition.next_rep = Date.today + 2**repetition.rep
    repetition.save!

    repetition = repetitions[1]

    if repetition
      redirect_to ask_words_repetition_path(repetition.word.id)
    else
      redirect_to packet_words_path(repetitions.last.word.packet_id)
    end
  end

  def ask
    @answer = Word.find(params[:id])
  end

end
