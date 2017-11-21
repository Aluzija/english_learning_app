class Word < ApplicationRecord
  belongs_to :packet

  validates :polish, presence: true
  validates :english, presence: true

  def words_same_polish_meaning
    Word.all.where("polish" => self.polish)
  end
end
