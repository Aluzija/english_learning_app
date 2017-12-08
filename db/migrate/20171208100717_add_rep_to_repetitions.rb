class AddRepToRepetitions < ActiveRecord::Migration[5.1]
  def change
    add_column :repetitions, :rep, :integer, default: 0
  end
end
