class AddTableWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :polish, null: false, uniqueness: true, index: true
      t.string :english, null: false, uniqueness: true, index: true
      t.string :polish_synonims
      t.string :english_synonims
      t.string :sample_sentence
      t.integer :repetition, default: 0
    end
  end
end
