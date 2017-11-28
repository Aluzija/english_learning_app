class Word < ApplicationRecord
  belongs_to :packet

  validates :polish, presence: true
  validates :english, presence: true
  validates :polish, uniqueness: { scope: "english" }

  def words_english_synonyms
    Word.all.where("polish" => self.polish)
  end

  def similar
    Word.where("english ilike ?", "#{self.english[0]}%").limit(3)
  end

end
