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
    if @answer.english_synonyms.any?
      synonyms = @answer.english_synonyms.split(", ")

      letter_repetition_array = synonyms.map do |synonym|
        @answer.english.first == synonym.first
      end
      if !letter_repetition_array.include?(false)
        @hint = @answer.english.first
      else
        
        @answer.each do |letter|
          while

          end
        end

      end


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

    end
  end

end
