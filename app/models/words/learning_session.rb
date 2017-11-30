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

end
