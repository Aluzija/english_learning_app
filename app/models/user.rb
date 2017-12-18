class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :packets
  has_many :words, through: :packets

  def after_database_authentication
    words_to_repeat = Words::Repetition.where("next_rep"<Date.today.to_s)
    if words_to_repeat.any?
      words_to_repeat.each do |word|
        word.next_rep = Date.today.to_s
        word.save!
      end
    end
    if email == "user@example.com"
      if packets.any?
        packets.each do |packet|
          packet.destroy
        end
      end
      packet1 = Packet.new(name: "zwierzęta", user_id: id)
      packet1.save!
      Word.new(polish: "homar", english: "lobster", packet_id: packet1.id).save!
      Word.new(polish: "ośmiornica", english: "octopus", packet_id: packet1.id).save!
      Word.new(polish: "borsuk", english: "badher", packet_id: packet1.id).save!
      Word.new(polish: "kazuar", english: "cassowary", packet_id: packet1.id).save!
      Word.new(polish: "ważka", english: "dragonfly", packet_id: packet1.id).save!
      Word.new(polish: "ryś", english: "bobcat", packet_id: packet1.id).save!
      Word.new(polish: "żuk", english: "beetle", packet_id: packet1.id, polish_synonyms: "chrząszcz").save!
      Word.new(polish: "suseł", english: "gopher", packet_id: packet1.id).save!
      Word.new(polish: "orzesznica", english: "dormouse", packet_id: packet1.id).save!
      Word.new(polish: "sokół", english: "falcon", packet_id: packet1.id).save!
      Word.new(polish: "czapla", english: "heron", packet_id: packet1.id).save!
      packet2 = Packet.new(name: "serial \"friends\"", user_id: id)
      packet2.save!
      words = [
        Word.new(polish: "uświadomić sobie", english: "realise", packet_id: packet2.id),
        Word.new(polish: "wychodzić", english: "go out", packet_id: packet2.id),
        Word.new(polish: "jak leci?", english: "what's up?", packet_id: packet2.id),
        Word.new(polish: "pokorny", english: "humble", packet_id: packet2.id ),
        Word.new(polish: "okazja", english: "opportunity", packet_id: packet2.id, polish_synonyms: "sposobność"),
        Word.new(polish: "oburzony", english: "indignant", packet_id: packet2.id)
      ]
        Word.new(polish: "wspaniały", english: "gorgeous", packet_id: packet2.id, english_synonyms: "sumptuous").save!
        Word.new(polish: "bogaty", english: "opulent", packet_id: packet2.id).save!
        Word.new(polish: "kpina", english: "mockery", packet_id: packet2.id).save!
        Word.new(polish: "bogaty", english: "sumptuous", packet_id: packet2.id, english_synonyms: "gorgeous").save!
        Word.new(polish: "spełnienie", english: "consummation", packet_id: packet2.id).save!
        Word.new(polish: "podły", english: "scurvy", packet_id: packet2.id).save!
        Word.new(polish: "zachłanny", english: "rapacious", packet_id: packet2.id).save!
      words.each do |word|
          word.save!
          Words::Repetition.new(word_id: word.id, packet_id: packet2.id, next_rep: Date.today.to_s).save!
      end
      packet3 = Packet.new(name: "różne", user_id: id)
      packet3.save!
      Word.new(polish: "skwapliwość", english: "alacrity", packet_id: packet3.id).save!
      Word.new(polish: "pracowity", english: "diligent", packet_id: packet3.id).save!
      Word.new(polish: "dziki", english: "feral", packet_id: packet3.id).save!
      Word.new(polish: "niedorzeczny", english: "inept", packet_id: packet3.id).save!
    end
  end

end
