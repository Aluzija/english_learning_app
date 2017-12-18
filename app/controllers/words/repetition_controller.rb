class Words::RepetitionController < ApplicationController

  def checker
    word_id = params[:id]
    @packet_id = Word.find(word_id).packet_id
    repetitions = Words::Repetition.order("next_rep").where("next_rep" => Date.today.to_s, "packet_id" => @packet_id)
    if repetitions.count >= @how_many.to_i && @how_many.to_i > 0
      redirect_to ask_words_repetition_path(word_id, how_many: @how_many)
    end
  end

  def index
    repetition = Words::Repetition.order("next_rep").where("next_rep" => Date.today.to_s, "packet_id" => params[:packet_id]).first
    correctness = to_boolean(params[:correctness])
    if correctness
      repetition.rep += 1
    else
      repetition.rep = 0
    end
    repetition.next_rep = Date.today + 2**repetition.rep
    repetition.save!

    how_many = params[:how_many].to_i - 1
    if how_many > 0
      repetition = Words::Repetition.order("next_rep").where("next_rep" => Date.today.to_s, "packet_id" => params[:packet_id]).first
      redirect_to ask_words_repetition_path(repetition.word.id, how_many: how_many)
    else
      redirect_to packet_words_path(params[:packet_id])
    end
  end

  def ask
    @how_many = params[:how_many]
    @answer = Word.find(params[:id])
    @packet_id = @answer.packet_id

    # if @answer.english_synonyms.any?
    #   synonyms = @answer.english_synonyms.split(", ")
    #
    #   letter_repetition_array = synonyms.map do |synonym|
    #     @answer.english.first == synonym.first
    #   end
    #   if !letter_repetition_array.include?(false)
    #     @hint = @answer.english.first
    #   else
    #
    #     @answer.each do |letter|
    #       while
    #
    #       end
    #     end
    #
    #   end


      #   if @hint.any?
      #
      #
      #   end
      #   while i < @answer.english.length
      #     if @answer.english[i] == synonym[i]
      #
      #     else
      #       i = 100
      #     end
      #     i +=1
      #   end
      # end
      # if synonyms.map { |synonym| @answer.english.include? synonym }.include?(true)
      #   @hint = @answer.english.first + "..." + @answer.english.last + "..."
      # elsif synonyms.map { |synonym| synonym.include? @answer.english }.include?(true)
      #   @hint = @answer.english.first + "..." + @answer.english.last
      # else

      # @hint = @answer.english.first + "..."

    # end
  end

end
