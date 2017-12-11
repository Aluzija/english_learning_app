class AddPacketIdToRepetitions < ActiveRecord::Migration[5.1]
  def change
    add_column :repetitions, :packet_id, :integer, null: false
    add_foreign_key :repetitions, :packets
  end
end
