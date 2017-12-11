class WordsController < ApplicationController

  def index
    @order = params[:order] || "id"
    user = current_user
    @packet = user.packets.find(params[:packet_id])
    @words = @packet.words.order(@order)
    @repetitions = Words::Repetition.where("next_rep" => Date.today.to_s, "packet_id" => @packet.id)
    @repetitions.any? ? @word_id = @repetitions.first.word.id : @word_id = 0
  end

  def new
    @word = Word.new(packet_id: params[:packet_id])
    @packet = @word.packet
  end

  def create
    @word = Word.new(word_params)
    @word.packet_id = params[:packet_id]
    @packet = @word.packet

    @other_words = @word.words_english_synonyms
    if @word.valid?
      if @other_words.any? && to_boolean(params[:confirm]) == false
        eng_synonyms = @other_words.map { |word| word.english }
        eng_synonyms << @word.english_synonyms if !@word.english_synonyms.empty?
        @word.english_synonyms = eng_synonyms.join(", ")
        render "confirm"
      elsif to_boolean(params[:confirm])
        @other_words.each do |word|
          eng_synonyms = []
          eng_synonyms << word.english_synonyms if !word.english_synonyms.empty?
          eng_synonyms << @word.english if @word.english_synonyms.include?(word.english)
          word.english_synonyms = eng_synonyms.join(", ")
          word.save
        end
        @word.save
        redirect_to packet_words_path(params[:packet_id])
      elsif !@other_words.any?
        @word.save
        redirect_to packet_words_path(params[:packet_id])
      end
    else
      render "new"
    end

  end

  def destroy
    @word = Word.find(params[:id])
    other_words = @word.words_english_synonyms
    other_words.each do |word|
      if word.english_synonyms.include?(@word.english)
        eng_synonyms = []
        eng_synonyms << word.english_synonyms
        eng_synonyms = eng_synonyms.join.split(", ")
        eng_synonyms.delete(@word.english)
        word.english_synonyms = eng_synonyms.join(", ")
        word.save
      end
    end
    @word.destroy
    redirect_to packet_words_path(@word.packet_id)
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to packet_words_path(@word.packet_id)
    else
      render "edit"
    end
  end

  def too_many
    @packet = Packet.find(params[:packet_id])
    @how_many = Word.where(learning_session_id: nil, packet_id: params[:packet_id]).count
  end

  private

  def word_params
    params.require(:word).permit(:polish, :english, :polish_synonyms, :english_synonyms, :sample_sentence)
  end

end
