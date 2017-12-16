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
  end

end
