class AddTablePackets < ActiveRecord::Migration[5.1]

  def change
    create_table :packets do |t|
      t.string :name, null:false
    end
  end

end
