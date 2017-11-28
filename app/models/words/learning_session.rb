class Words::LearningSession < ApplicationRecord

  serialize :good_answers, Hash
  serialize :wrong_answers, Hash
  serialize :words_ids, Array
  
end
