class Packet < ApplicationRecord
  has_many :words, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true


end
