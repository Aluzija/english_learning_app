class Words::RepetitionController < ApplicationController

  def index
    repetition = Words::Repetition.where("next_rep" => Date.today.to_s, "packet_id" => params[:packet_id]).first
    correctness = to_boolean(params[:correctness])
    repetition.rep += 1 if correctness
    repetition.next_rep = Date.today + 2**repetition.rep
    repetition.save!

    repetition = Words::Repetition.where("next_rep" => Date.today.to_s, "packet_id" => params[:packet_id]).first

    if !repetition.nil?
      redirect_to ask_words_repetition_path(repetition.word.id)
    else
      redirect_to packet_words_path(params[:packet_id])
    end
  end

  def ask
    @answer = Word.find(params[:id])
  end

end
