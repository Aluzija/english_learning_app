class Word < ApplicationRecord
  belongs_to :packet
  has_one :repetition, class_name: "Words::Repetition", dependent: :destroy

  validates :polish, presence: true
  validates :english, presence: true
  validates :polish, uniqueness: { scope: ["english", "packet_id"] }

  def words_english_synonyms
    Word.all.where("polish" => self.polish, "packet_id" => self.packet_id)
  end

  def similar
    words = Word.where("id <> ? AND english ilike ?", id, "#{self.english[0]}%").limit(3)
    if words.length < 3
      how_many = 3 - words.length
      words += Word.all.where("id <> ?", id).limit(how_many)
    end
    words
  end

end
