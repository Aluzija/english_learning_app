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

    eng_synonyms = @word.words_same_polish_meaning
    if eng_synonyms.any? && !params[:confirm]
      eng_synonyms = eng_synonyms.map { |word| word.english }
      @word.english_synonyms = eng_synonyms.join(", ")
      render "confirm"

    else
      if @word.save
        redirect_to user_packet_words_path(params[:user_id], params[:packet_id])
      else
        render "new"
      end
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
