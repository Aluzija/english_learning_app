require "byebug"

class WordsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    @packet = user.packets.find(params[:packet_id])
  end

  def new
    @word = Word.new(packet_id: params[:packet_id])
    @packet = @word.packet
  end

  def create
    @word = Word.new(word_params)
    @word.packet_id = params[:packet_id]
    @packet = @word.packet
    other_words = @word.words_english_synonyms
    if other_words.any? && to_boolean(params[:confirm]) == false
      eng_synonyms = other_words.map { |word| word.english }
      eng_synonyms << @word.english_synonyms if !@word.english_synonyms.empty?
      @word.english_synonyms = eng_synonyms.join(", ")
      if render "confirm"

      end

    # else
    #   if @word.valid?
    #     if params[:confirm]
    #       other_words = @word.words_same_polish_meaning
    #       other_words.each do |word|
    #         word.english_synonyms = (word.english_synonyms + @word.english).split.join(", ")
    #         word.save
    #       end
    #     end
    #     @word.save
    #     redirect_to user_packet_words_path(params[:user_id], params[:packet_id])
    #   else
    #     render "new"
    #   end
    # end

    elsif @word.save
      redirect_to user_packet_words_path(params[:user_id], params[:packet_id])
    else
      render "new"
    end

  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
    redirect_to user_packet_words_path(params[:user_id], params[:packet_id])
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to user_packet_words_path(params[:user_id], params[:packet_id])
    else
      render "edit"
    end
  end

  private

  def word_params
    params.require(:word).permit(:polish, :english, :polish_synonyms, :english_synonyms, :sample_sentence)
  end
end
