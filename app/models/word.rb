class Word < ApplicationRecord
  belongs_to :packet

  validates :polish, presence: true
  validates :english, presence: true
  validates :polish, uniqueness: { scope: "english" }

  def words_english_synonyms
    Word.all.where("polish" => self.polish)
  end

end
