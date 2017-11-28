class ChangeColumnTypeInLearningSessions < ActiveRecord::Migration[5.1]
  def change
    change_table :learning_sessions do |t|
      t.change :words_ids, :text
    end
  end
end
