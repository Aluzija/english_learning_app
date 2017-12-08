class CreateRepetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :repetitions do |t|
      t.integer :word_id, null: false
      t.date :last_rep
      t.date :next_rep, null: false
    end
    add_foreign_key :repetitions, :words
  end
end
