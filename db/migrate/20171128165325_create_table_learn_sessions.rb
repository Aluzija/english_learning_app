class CreateTableLearnSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :learning_sessions do |t|
      t.integer :words_ids, null: false
      t.text :good_answers, null: false
      t.text :wrong_answers, null: false
      t.boolean :completed, default: false
    end
    add_reference :learning_sessions, :user, foreign_key: true, null: false
  end
end
