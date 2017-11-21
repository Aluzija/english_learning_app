class ChangeWordsColumnPacketIdToNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :words, :packet_id, false
  end
end
