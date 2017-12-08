class DeleteRepetitionsFromWords < ActiveRecord::Migration[5.1]
  def change
    remove_column :words, :repetition
  end
end
