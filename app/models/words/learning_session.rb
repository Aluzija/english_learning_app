class Words::LearningSession < ApplicationRecord

  serialize :good_answers, Hash
  serialize :wrong_answers, Hash
  serialize :words_ids, Array

  def words
    arr = words_ids.map do |id|
      id.to_s
    end
    Word.find(arr)
  end

  def self.packet(id)
    word_id = find(id).words_ids[0]
    Word.find(word_id).packet_id
  end

end
