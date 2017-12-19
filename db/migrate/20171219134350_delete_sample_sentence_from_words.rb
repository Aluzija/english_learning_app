class DeleteSampleSentenceFromWords < ActiveRecord::Migration[5.1]
  def change
    remove_column :words, :sample_sentence
  end
end
