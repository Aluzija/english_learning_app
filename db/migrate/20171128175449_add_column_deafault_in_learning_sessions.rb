class AddColumnDeafaultInLearningSessions < ActiveRecord::Migration[5.1]
  def change
    change_column_default :learning_sessions, :good_answers, from: nil, to: { 1 => [], 2 => [], 3 => [], 4 => [], 5 => [] }.to_yaml
    change_column_default :learning_sessions, :wrong_answers, from: nil, to: { 1 => [], 2 => [], 3 => [], 4 => [], 5 => [] }.to_yaml
  end
end
