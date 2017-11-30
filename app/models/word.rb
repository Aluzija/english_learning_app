require "byebug"
class Word < ApplicationRecord
  belongs_to :packet

  validates :polish, presence: true
  validates :english, presence: true
  validates :polish, uniqueness: { scope: "english" }

  def words_english_synonyms
    Word.all.where("polish" => self.polish)
  end

  def similar
    words = Word.where("id <> ? AND english ilike ?", id, "#{self.english[0]}%").limit(3)
    if words.length < 3
      how_many = 3 - words.length
      words += Word.all.where("id <> ?", id).limit(how_many)
    end
  end

end
