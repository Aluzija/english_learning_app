class AddPacketIdToWords < ActiveRecord::Migration[5.1]
  def change
    add_column :words, :packet_id, :integer
    add_index :words, :packet_id
  end
end
