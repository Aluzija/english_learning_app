class Word < ApplicationRecord
  belongs_to :packet

  validates :polish, presence: true
  validates :english, presence: true
end
